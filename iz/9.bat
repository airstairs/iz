@echo off
REM Check if tmux session 9 exists and kill it if it does
tmux has-session -t 9 >nul 2>&1
if %errorlevel% equ 0 (
    tmux kill-session -t 9
)

REM 1. Create new session with the top-left pane running cmatrix -C blue
tmux new-session -d -s 9 "cmatrix -C blue"

REM 2. Split vertically to create the bottom full-width pane running cmatrix -C red
tmux split-window -v -t 9 "cmatrix -C white"

REM 3. Split the top pane horizontally to create the top-right pane running cmatrix -C white
tmux split-window -h -t 9.0 "cmatrix -C white"

REM 4. Split the right pane vertically to create the middle-right pane running cmatrix -C red
tmux split-window -v -t 9.1 "cmatrix -C red"

REM 5. Split pane 3 vertically (simulating Ctrl+b ") running cmatrix -C green
tmux split-window -v -t 9.3 "cmatrix -C red"

REM Attach to the newly created session
tmux attach-session -t 9