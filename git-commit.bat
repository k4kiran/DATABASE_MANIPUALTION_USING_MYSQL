@echo off

echo Commit on GitHub

echo.

set /p comment="Enter comment:
"
git add .

git commit -m "%comment%"

git push


echo.
echo Committed Successfullly :)


pause