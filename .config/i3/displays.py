#!/usr/bin/python3
import logging
import subprocess

FALLBACK_SCREEN = "eDP-1"

logger = logging.getLogger(__name__)


def xrandr_info() -> str:
    return subprocess.check_output(["xrandr"]).decode("utf-8")


def connected_screens(xrandr_info: str) -> list[str]:
    output = [line for line in xrandr_info.splitlines()]
    screens = [line.split()[0] for line in output if " connected " in line]
    logger.info("Connected screens: %s", screens)
    return screens


def get_primary_screen(connected_screens: list[str]) -> str:
    order = ("DP-1-2",)
    primary_screen = FALLBACK_SCREEN
    for screen in order:
        if screen in connected_screens:
            primary_screen = screen
            break
    logger.info("Selecting `%s` as primary screen", primary_screen)
    return primary_screen


def set_primary_screen(screen: str) -> None:
    if screen == "DP-1-2":
        mode = "5120x1440"
        rate = 165
        subprocess.run(["xrandr", "--output", "eDP-1", "--off"])
    else:
        mode = "2560x1600"
        rate = 165

    command = [
        str(arg)
        for arg in [
            "xrandr",
            "--output",
            screen,
            "--primary",
            "--mode",
            mode,
            "--rate",
            rate,
        ]
    ]
    logger.info("Running: %s", command)
    subprocess.run(command)


def main() -> None:
    xrandr = xrandr_info()
    screens = connected_screens(xrandr)
    primary_screen = get_primary_screen(screens)
    set_primary_screen(primary_screen)


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG, format="[%(levelname)s] %(message)s")
    main()
