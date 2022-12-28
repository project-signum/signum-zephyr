# Copyright (c) 2023 Brett Witherspoon
# SPDX-License-Identifier: Apache-2.0

board_runner_args(openocd "--use-elf" "--cmd-reset-halt" "halt")
include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
