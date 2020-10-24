@echo off

REM ---------------------------------------- LICENSE -------------------------------------------------------
REM
REM    Copyright (c) 2006-2012+, MekDrop <github@mekdrop.name>
REM
REM    Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission
REM    notice appear in all copies.
REM
REM    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
REM    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
REM    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
REM     OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
REM
REM ---------------------------------------- NOTE -------------------------------------------------------
REM
REM    This app is can run only on Windows 2000 or newer

rem Setting default data
setlocal
set app_name=%0
set language=en
set kalbos_failas=.\Language\%language%.csv
chcp 65001 >NUL

rem Parsing command line options
:skaityti_komandines_eilutes_parametra
SET parsed_param=%1
shift
if "%parsed_param%"=="" goto pradzia
if "%parsed_param%"=="/?" goto parodyti_pagalba
if "%parsed_param%"=="/L" goto nustatyti_kalba
goto skaityti_komandines_eilutes_parametra

:ikelti_kalba
for /f "tokens=1,* delims=, eol=;" %%a in (%kalbos_failas%) do (
    set vertimas[%%a]=%%b
)
exit /b

:nustatyti_kalba
set language=%1
shift
set kalbos_failas=.\Language\%language%.csv
if not exist %kalbos_failas% (
    set language=en
    echo "Warning: language not found. Switching to en."
    set kalbos_failas=.\Language\%language%.csv
)
goto skaityti_komandines_eilutes_parametra

:parodyti_pagalba
call :ikelti_kalba
echo.
echo %vertimas[parodyti_pagalba.sintakse]%
echo.   %app_name% [/?] [/L %vertimas[parodyti_pagalba.kodas]%]
echo.
echo %vertimas[parodyti_pagalba.parametrai]%
echo.   /?       %vertimas[parodyti_pagalba.parametras.pagalba]%
echo.   /L %vertimas[parodyti_pagalba.kodas]%  %vertimas[parodyti_pagalba.parametras.kalba]%
echo.
goto pabaiga

:pradzia
rem Here we setting default values for all of our variables
call :ikelti_kalba
set tuscias_langelis=%%
set zaidejas1=X
set zaidejas2=O
set e1=%tuscias_langelis%
set e2=%tuscias_langelis%
set e3=%tuscias_langelis%
set e4=%tuscias_langelis%
set e5=%tuscias_langelis%
set e6=%tuscias_langelis%
set e7=%tuscias_langelis%
set e8=%tuscias_langelis%
set e9=%tuscias_langelis%
set e_spc=
set emsg=
goto braizom

:braizom
rem This part is used for drawing the board
rem We need to specify value for griztam variable, before using this part (is use label names)
cls
echo   %e1% ! %e2% ! %e3%
echo   - + - + -
echo   %e4% ! %e5% ! %e6%
echo   - + - + -
echo   %e7% ! %e8% ! %e9%
echo.
rem If there was an error, we show this here
if NOT "%e_spc%"=="" (
   echo %emsg%
   echo.
   goto %e_spc%
)
if NOT "%klaida%"=="" (
   echo %vertimas[braizom.klaida]% %klaida%
   echo.
)
rem Here it's possible enter where to place mark
set zenklas=%zaidejas1%
echo %vertimas[braizom.iveskite_kordinate]%
set /P ejimas=
goto tikrink

:tikrink
set klaida=
if "%ejimas%"=="1" (
    if "%e1%"=="%tuscias_langelis%" (
	    set e1=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="2" (
    if "%e2%"=="%tuscias_langelis%" (
	    set e2=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="3" (
    if "%e3%"=="%tuscias_langelis%" (
	    set e3=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="4" (
    if "%e4%"=="%tuscias_langelis%" (
	    set e4=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="5" (
    if "%e5%"=="%tuscias_langelis%" (
	    set e5=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="6" (
    if "%e6%"=="%tuscias_langelis%" (
	    set e6=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="7" (
    if "%e7%"=="%tuscias_langelis%" (
	    set e7=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="8" (
    if "%e8%"=="%tuscias_langelis%" (
	    set e8=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
if "%ejimas%"=="9" (
    if "%e9%"=="%tuscias_langelis%" (
	    set e9=%zenklas%
    ) else (
	    set klaida=%vertimas[tikrink.jau_egzistuoja]%
    )
)
rem if entered number is lower than 1, also that was an error!
if /I %ejimas% LSS 1 (
    set klaida=%vertimas[tikrink.bloga_koordinate]%
)
rem if entered number is greater than 9, also that was an error!
if /I %ejimas% GTR 9 (
    set klaida=%vertimas[tikrink.bloga_koordinate]%
)
rem checking if there was a previous error
rem if that was the computer turn, we hide all errors
if NOT "%klaida%"=="" (
    if "%zenklas%"=="%zaidejas1%" (
	    goto braizom
    ) else (
	    goto kompiuteris
    )
)

rem here we are checking if somebody wins
if "%e1%%e2%%e3%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas
if "%e4%%e5%%e6%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas
if "%e7%%e8%%e9%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas

if "%e1%%e4%%e7%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas
if "%e2%%e5%%e8%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas
if "%e3%%e6%%e9%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas

if "%e1%%e5%%e9%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas
if "%e3%%e5%%e7%" == "%zenklas%%zenklas%%zenklas%" goto laimejimas

if NOT "%e1%"=="%tuscias_langelis%" (
   if NOT "%e2%"=="%tuscias_langelis%" (
        if NOT "%e3%"=="%tuscias_langelis%" (
            if NOT "%e4%"=="%tuscias_langelis%" (
                if NOT "%e5%"=="%tuscias_langelis%" (
                    if NOT "%e6%"=="%tuscias_langelis%" (
	                    if NOT "%e7%"=="%tuscias_langelis%" (
                            if NOT "%e8%"=="%tuscias_langelis%" (
	                            if NOT "%e9%"=="%tuscias_langelis%" (
		                            goto lygiosios
                                )
           	                )
         	            )
    	            )
  	            )
	        )
        )
   )
)

rem if you are in this place, it means you have places a mark sucessfully!
rem now we thinking what to doo next
if "%zenklas%"=="%zaidejas1%" goto kompiuteris
set griztam=ivedimas
goto braizom

:kompiuteris
rem here is a computer turn
set zenklas=%zaidejas2%
set /A ejimas=%RANDOM%/(32752/(9-1))+1
goto tikrink

:laimejimas
if "%zenklas%"=="%zaidejas1%" (
    set emsg=%vertimas[laimejimas.zaidejas]%
) else (
    set emsg=%vertimas[laimejimas.kompiuteris]%
)

set e_spc=arzaistidar
echo.
echo.
goto braizom

:lygiosios
set emsg=%vertimas[lygiosios.lygiosios]%
set e_spc=arzaistidar
echo.
echo.
goto braizom

:arzaistidar
echo %vertimas[arzaistidar.klausimas]%
set /p ats=
if "%ats%" == "%vertimas[arzaistidar.taip]%" goto pradzia
if "%ats%" == "%vertimas[arzaistidar.taip]:~0,1%" goto pradzia
if "%ats%" == "%vertimas[arzaistidar.ne]%" goto pabaiga
if "%ats%" == "%vertimas[arzaistidar.ne]:~0,1%" goto pabaiga
cls
goto arzaistidar

:pabaiga