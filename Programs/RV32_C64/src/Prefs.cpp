/*
 *  Prefs.cpp - Global preferences
 *
 *  Frodo Copyright (C) Christian Bauer
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "sysdeps.h"

#include "Prefs.h"
#include "C64.h"

#include "rv32_input.h"

#include <algorithm>
#include <fstream>
#include <regex>

// Button name ↔ enum lookup (mirrors SDL naming)
static const struct { const char * name; SDL_GameControllerButton button; } k_button_names[] = {
	{ "a",            SDL_CONTROLLER_BUTTON_A },
	{ "b",            SDL_CONTROLLER_BUTTON_B },
	{ "x",            SDL_CONTROLLER_BUTTON_X },
	{ "y",            SDL_CONTROLLER_BUTTON_Y },
	{ "back",         SDL_CONTROLLER_BUTTON_BACK },
	{ "guide",        SDL_CONTROLLER_BUTTON_GUIDE },
	{ "start",        SDL_CONTROLLER_BUTTON_START },
	{ "leftstick",    SDL_CONTROLLER_BUTTON_LEFTSTICK },
	{ "rightstick",   SDL_CONTROLLER_BUTTON_RIGHTSTICK },
	{ "leftshoulder", SDL_CONTROLLER_BUTTON_LEFTSHOULDER },
	{ "rightshoulder",SDL_CONTROLLER_BUTTON_RIGHTSHOULDER },
	{ "dpup",         SDL_CONTROLLER_BUTTON_DPAD_UP },
	{ "dpdown",       SDL_CONTROLLER_BUTTON_DPAD_DOWN },
	{ "dpleft",       SDL_CONTROLLER_BUTTON_DPAD_LEFT },
	{ "dpright",      SDL_CONTROLLER_BUTTON_DPAD_RIGHT },
};

static SDL_GameControllerButton button_from_string(const char * name)
{
	for (const auto & e : k_button_names) {
		if (strcmp(e.name, name) == 0) return e.button;
	}
	return SDL_CONTROLLER_BUTTON_INVALID;
}

static const char * string_for_button(SDL_GameControllerButton b)
{
	for (const auto & e : k_button_names) {
		if (e.button == b) return e.name;
	}
	return nullptr;
}

// These are the active preferences
Prefs ThePrefs;


/*
 *  Constructor: Set up preferences with defaults
 */

Prefs::Prefs()
{
	NormalCycles = CYCLES_PER_LINE;
	BadLineCycles = CYCLES_PER_LINE - 40;
	CIACycles = CYCLES_PER_LINE;
	FloppyCycles = 64;
	ScalingNumerator = 4;
	ScalingDenominator = 1;
	TestMaxFrames = 0;

	SIDType = SIDTYPE_DIGITAL_6581;
	REUType = REU_NONE;
	DisplayType = DISPTYPE_WINDOW;
	Palette = PALETTE_PEPTO;
	Joystick1Port = 0;
	Joystick2Port = 0;

	SpriteCollisions = true;
	JoystickSwap = false;
	TwinStick = false;
	TapeRumble = false;
	LimitSpeed = true;
	FastReset = true;
	CIAIRQHack = false;
	MapSlash = true;
	Emul1541Proc = true;
	ShowLEDs = true;
	AutoStart = false;
	TestBench = false;
}


/*
 *  Check preferences for validity and correct if necessary
 */

void Prefs::Check()
{
	if (ScalingNumerator <= 0) {
		ScalingNumerator = 1;
	}

	if (ScalingDenominator <= 0) {
		ScalingDenominator = 1;
	}

	if (TestMaxFrames < 0) {
		TestMaxFrames = 0;
	}

	if (SIDType < SIDTYPE_NONE || SIDType > SIDTYPE_SIDCARD) {
		SIDType = SIDTYPE_NONE;
	}

	if (REUType < REU_NONE || REUType > REU_GEORAM) {
		REUType = REU_NONE;
	}

	if (DisplayType < DISPTYPE_WINDOW || DisplayType > DISPTYPE_SCREEN) {
		DisplayType = DISPTYPE_WINDOW;
	}

	if (Palette < PALETTE_PEPTO || Palette > PALETTE_COLODORE) {
		Palette = PALETTE_PEPTO;
	}

	if (ROMSetDefs.count(ROMSet) == 0) {
		ROMSet.clear();
	}

	if (ButtonMapDefs.count(ButtonMap) == 0) {
		ButtonMap.clear();
	}
}


/*
 *  Load preferences from file
 */

void Prefs::Load(const std::string & prefs_path)
{
	std::ifstream file(prefs_path);
	if (! file) {
		fprintf(stderr, "WARNING: Cannot open configuration file '%s'\n", prefs_path.c_str());
		return;
	}

	std::string line;
	while (std::getline(file, line)) {
		ParseItem(line);
	}

	Check();
}


/*
 *  Parse preferences item ("KEYWORD = VALUE")
 */

void Prefs::ParseItem(std::string item)
{
	if (item.empty())
		return;

	static const std::regex prefsLine(R"((\S*)\s*=\s*([\S ]*))");

	std::smatch m;
	if (! std::regex_match(item, m, prefsLine)) {
		fprintf(stderr, "WARNING: Ignoring malformed settings item '%s'\n", item.c_str());
		return;
	}

	const std::string keyword = m[1].str();
	std::string value = m[2].str();

	if (keyword == "NormalCycles") {
		NormalCycles = atoi(value.c_str());
	} else if (keyword == "BadLineCycles") {
		BadLineCycles = atoi(value.c_str());
	} else if (keyword == "CIACycles") {
		CIACycles = atoi(value.c_str());
	} else if (keyword == "FloppyCycles") {
		FloppyCycles = atoi(value.c_str());

	} else if (keyword == "DrivePath8") {
		DrivePath[0] = value;
	} else if (keyword == "DrivePath9") {
		DrivePath[1] = value;
	} else if (keyword == "DrivePath10") {
		DrivePath[2] = value;
	} else if (keyword == "DrivePath11") {
		DrivePath[3] = value;

	} else if (keyword == "TapePath") {
		TapePath = value;

	} else if (keyword == "ROMSetDef") {
		if (std::count(value.begin(), value.end(), ';') == 4) {
			ROMPaths p;
			auto pos = value.find(';');
			std::string name = value.substr(0, pos);

			auto last = pos + 1;
			pos = value.find(';', last);
			p.BasicROMPath = value.substr(last, pos - last);

			last = pos + 1;
			pos = value.find(';', last);
			p.KernalROMPath = value.substr(last, pos - last);

			last = pos + 1;
			pos = value.find(';', last);
			p.CharROMPath = value.substr(last, pos - last);
			p.DriveROMPath = value.substr(pos + 1);

			ROMSetDefs[name] = p;
		}
	} else if (keyword == "ROMSet") {
		ROMSet = value;

	} else if (keyword == "ButtonMapDef") {
		ButtonMapping mapping;

		auto pos = value.find(';');
		std::string name = value.substr(0, pos);

		while (pos != std::string::npos) {
			value.erase(0, pos + 1);

			pos = value.find(';');
			std::string map_str = value.substr(0, pos);

			static const std::regex mapItem(R"((\S*):([\S ]*))");
			std::smatch mi;
			if (std::regex_match(map_str, mi, mapItem)) {
				SDL_GameControllerButton button = button_from_string(mi[1].str().c_str());
				std::string key_name = mi[2].str();
				if (key_name == "colon") {
					key_name = ":";
				} else if (key_name == "semicolon") {
					key_name = ";";
				}
				int keycode = KeycodeFromString(key_name);

				if (button != SDL_CONTROLLER_BUTTON_INVALID && keycode >= 0) {
					mapping[button] = keycode;
				}
			}
		}

		if (! name.empty()) {
			ButtonMapDefs[name] = mapping;
		}
	} else if (keyword == "ButtonMap") {
		ButtonMap = value;

	} else if (keyword == "Cartridge") {
		CartridgePath = value;

	} else if (keyword == "LoadProgram") {
		LoadProgram = value;

	} else if (keyword == "TestScreenshot") {
		TestScreenshotPath = value;

	} else if (keyword == "SIDType") {
		if (value == "DIGITAL") {
			SIDType = SIDTYPE_DIGITAL_6581;
		} else if (value == "6581") {
			SIDType = SIDTYPE_DIGITAL_6581;
		} else if (value == "8580") {
			SIDType = SIDTYPE_DIGITAL_8580;
		} else if (value == "SIDCARD") {
			SIDType = SIDTYPE_SIDCARD;
		} else {
			SIDType = SIDTYPE_NONE;
		}
	} else if (keyword == "REUType") {
		if (value == "128K") {
			REUType = REU_128K;
		} else if (value == "256K") {
			REUType = REU_256K;
		} else if (value == "512K") {
			REUType = REU_512K;
		} else if (value == "GEORAM") {
			REUType = REU_GEORAM;
		} else {
			REUType = REU_NONE;
		}
	} else if (keyword == "DisplayType") {
		DisplayType = (value == "SCREEN") ? DISPTYPE_SCREEN : DISPTYPE_WINDOW;
	} else if (keyword == "Palette") {
		Palette = (value == "COLODORE") ? PALETTE_COLODORE : PALETTE_PEPTO;
	} else if (keyword == "Joystick1Port") {
		Joystick1Port = atoi(value.c_str());
	} else if (keyword == "Joystick2Port") {
		Joystick2Port = atoi(value.c_str());
	} else if (keyword == "ScalingNumerator") {
		ScalingNumerator = atoi(value.c_str());
	} else if (keyword == "ScalingDenominator") {
		ScalingDenominator = atoi(value.c_str());
	} else if (keyword == "TestMaxFrames") {
		TestMaxFrames = atoi(value.c_str());

	} else if (keyword == "SpriteCollisions") {
		SpriteCollisions = (value == "true");
	} else if (keyword == "JoystickSwap") {
		JoystickSwap = (value == "true");
	} else if (keyword == "TwinStick") {
		TwinStick = (value == "true");
	} else if (keyword == "TapeRumble") {
		TapeRumble = (value == "true");
	} else if (keyword == "LimitSpeed") {
		LimitSpeed = (value == "true");
	} else if (keyword == "FastReset") {
		FastReset = (value == "true");
	} else if (keyword == "CIAIRQHack") {
		CIAIRQHack = (value == "true");
	} else if (keyword == "MapSlash") {
		MapSlash = (value == "true");
	} else if (keyword == "Emul1541Proc") {
		Emul1541Proc = (value == "true");
	} else if (keyword == "ShowLEDs") {
		ShowLEDs = (value == "true");
	} else if (keyword == "AutoStart") {
		AutoStart = (value == "true");
	} else if (keyword == "TestBench") {
		TestBench = (value == "true");

	} else {
		fprintf(stderr, "WARNING: Ignoring unknown settings item '%s'\n", keyword.c_str());
	}
}


/*
 *  Save preferences to file
 *  true: success, false: error
 */

bool Prefs::Save(const std::string & prefs_path)
{
	Check();

	FILE * f = fopen(prefs_path.c_str(), "w");
	if (! f) {
		return false;
	}

#define BOOL(v) ((v) ? "true" : "false")

	fprintf(f, "NormalCycles = %d\n", NormalCycles);
	fprintf(f, "BadLineCycles = %d\n", BadLineCycles);
	fprintf(f, "CIACycles = %d\n", CIACycles);
	fprintf(f, "FloppyCycles = %d\n", FloppyCycles);

	for (unsigned i = 0; i < 4; ++i) {
		fprintf(f, "DrivePath%u = %s\n", i + 8, DrivePath[i].c_str());
	}

	fprintf(f, "TapePath = %s\n", TapePath.c_str());

	for (const auto & [name, paths] : ROMSetDefs) {
		fprintf(f, "ROMSetDef = %s;%s;%s;%s;%s\n",
			name.c_str(), paths.BasicROMPath.c_str(), paths.KernalROMPath.c_str(),
			paths.CharROMPath.c_str(), paths.DriveROMPath.c_str());
	}
	fprintf(f, "ROMSet = %s\n", ROMSet.c_str());

	fprintf(f, "Cartridge = %s\n", CartridgePath.c_str());

	switch (SIDType) {
		case SIDTYPE_NONE:         fprintf(f, "SIDType = NONE\n");    break;
		case SIDTYPE_DIGITAL_6581: fprintf(f, "SIDType = 6581\n");    break;
		case SIDTYPE_DIGITAL_8580: fprintf(f, "SIDType = 8580\n");    break;
		case SIDTYPE_SIDCARD:      fprintf(f, "SIDType = SIDCARD\n"); break;
	}
	switch (REUType) {
		case REU_NONE:   fprintf(f, "REUType = NONE\n");   break;
		case REU_128K:   fprintf(f, "REUType = 128K\n");   break;
		case REU_256K:   fprintf(f, "REUType = 256K\n");   break;
		case REU_512K:   fprintf(f, "REUType = 512K\n");   break;
		case REU_GEORAM: fprintf(f, "REUType = GEORAM\n"); break;
	}
	fprintf(f, "DisplayType = %s\n", DisplayType == DISPTYPE_WINDOW ? "WINDOW" : "SCREEN");
	fprintf(f, "Palette = %s\n", Palette == PALETTE_COLODORE ? "COLODORE" : "PEPTO");
	fprintf(f, "Joystick1Port = %d\n", Joystick1Port);
	fprintf(f, "Joystick2Port = %d\n", Joystick2Port);
	fprintf(f, "ScalingNumerator = %d\n", ScalingNumerator);
	fprintf(f, "ScalingDenominator = %d\n", ScalingDenominator);

	for (const auto & [name, mapping] : ButtonMapDefs) {
		fprintf(f, "ButtonMapDef = %s", name.c_str());
		for (const auto & [button, keycode] : mapping) {
			std::string key_name = StringForKeycode(keycode);
			const char * key_str;
			if (key_name == ":") {
				key_str = "colon";
			} else if (key_name == ";") {
				key_str = "semicolon";
			} else {
				key_str = key_name.c_str();
			}
			fprintf(f, ";%s:%s", string_for_button((SDL_GameControllerButton) button), key_str);
		}
		fprintf(f, "\n");
	}
	fprintf(f, "ButtonMap = %s\n", ButtonMap.c_str());

	fprintf(f, "SpriteCollisions = %s\n", BOOL(SpriteCollisions));
	fprintf(f, "JoystickSwap = %s\n",     BOOL(JoystickSwap));
	fprintf(f, "TwinStick = %s\n",        BOOL(TwinStick));
	fprintf(f, "TapeRumble = %s\n",       BOOL(TapeRumble));
	fprintf(f, "LimitSpeed = %s\n",       BOOL(LimitSpeed));
	fprintf(f, "FastReset = %s\n",        BOOL(FastReset));
	fprintf(f, "CIAIRQHack = %s\n",       BOOL(CIAIRQHack));
	fprintf(f, "MapSlash = %s\n",         BOOL(MapSlash));
	fprintf(f, "Emul1541Proc = %s\n",     BOOL(Emul1541Proc));
	fprintf(f, "ShowLEDs = %s\n",         BOOL(ShowLEDs));

#undef BOOL

	fclose(f);
	return true;
}


/*
 *  Return paths of selected ROM set (or set of empty paths if not found)
 */

ROMPaths Prefs::SelectedROMPaths() const
{
	auto it = ROMSetDefs.find(ROMSet);
	return it == ROMSetDefs.end() ? ROMPaths{} : it->second;
}


/*
 *  Return selected controller button mapping
 */

ButtonMapping Prefs::SelectedButtonMapping() const
{
	auto it = ButtonMapDefs.find(ButtonMap);
	return it == ButtonMapDefs.end() ? ButtonMapping{} : it->second;
}


#ifdef HAVE_GTK
#include "Prefs_gtk.h"
#else
#include "Prefs_none.h"
#endif
