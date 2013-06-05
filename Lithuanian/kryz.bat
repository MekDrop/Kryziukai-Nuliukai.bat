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
REM    This app is in Lithuanian language and can run only on Windows 2000 or newer

:pradzia
rem shioje vietoje aprashome kintamuosius pagal nutylejima
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
rem shi vieta yra skirta brezti lenta
rem priesh kreipiantis i shia vieta reikia nurodyti griztam kintamaji
rem shio kintamojo reiksme turi sutapti su atitinkamo label (nzn kaip lietuvishkai)
rem reiksme
cls
echo   %e1% ! %e2% ! %e3%
echo   - + - + - 
echo   %e4% ! %e5% ! %e6%
echo   - + - + - 
echo   %e7% ! %e8% ! %e9%
echo.
rem jei ivyko klaida, ishvedame praneshima apie tai
if NOT "%e_spc%"=="" (
   echo %emsg%
   echo.
   goto %e_spc%
)
if NOT "%klaida%"=="" (
   echo Klaida: %klaida%
   echo.
)
rem shioje vietoje galima ivesti, kur deti kryziuka
set zenklas=%zaidejas1%
echo Iveskite kordinate (1-9):
set /P ejimas=
goto tikrink

:tikrink
set klaida=
if "%ejimas%"=="1" (
    if "%e1%"=="%tuscias_langelis%" (
	set e1=%zenklas%
    ) else (	
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="2" (
    if "%e2%"=="%tuscias_langelis%" (
	set e2=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="3" (
    if "%e3%"=="%tuscias_langelis%" (
	set e3=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="4" (
    if "%e4%"=="%tuscias_langelis%" (
	set e4=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="5" (
    if "%e5%"=="%tuscias_langelis%" (
	set e5=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="6" (
    if "%e6%"=="%tuscias_langelis%" (
	set e6=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="7" (
    if "%e7%"=="%tuscias_langelis%" (
	set e7=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="8" (
    if "%e8%"=="%tuscias_langelis%" (
	set e8=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
if "%ejimas%"=="9" (
    if "%e9%"=="%tuscias_langelis%" (
	set e9=%zenklas%
    ) else (
	set klaida=Toks jau yra!
    )
)
rem jei ivestas skaicius mazesnis uz vieneta tada tai irgi klaida
if /I %ejimas% LSS 1 (
   set klaida=Ivesta bloga kordinate
)
rem jei ivestas skaicius didesnis uz devynis tada tai irgi klaida
if /I %ejimas% GTR 9 (
   set klaida=Ivesta bloga kordinate
)
rem ziurime ar buvo ivykusi klaida
rem klaidas ishvedam tik tuo atveju 
rem jei zaidejas dejo zenkla 
if NOT "%klaida%"=="" (
    if "%zenklas%"=="%zaidejas1%" (
	goto braizom
    ) else (
	goto kompiuteris
    )
)

rem shioje vietoje reiktu tikrinima ideti ar nelaimejo kas
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

rem jeigu iki shios vietos priejom, vadinasi 
rem padejome tikrai zenkla (na arba bent kompiuteris
rem padejo, todel sprendziame shioje vietoje
rem ka daryti toliau)
if "%zenklas%"=="%zaidejas1%" goto kompiuteris
set griztam=ivedimas
goto braizom

:kompiuteris
rem shioje vietoje zengia kompiuteris
set zenklas=%zaidejas2%
set /A ejimas=%RANDOM%/(32752/(9-1))+1
goto tikrink

:laimejimas
if "%zenklas%"=="%zaidejas1%" (
  set emsg=Zaidejas laimejo
) else (
  set emsg=Kompiuteris laimejo
)

set e_spc=arzaistidar
echo.
echo.
goto braizom

:lygiosios 
set emsg=Lygiosios
set e_spc=arzaistidar
echo.
echo.
goto braizom

:arzaistidar
echo Ar norite zaisti dar (taip/ne)? 
set /p ats=
if "%ats%" == "taip" goto pradzia
if "%ats%" == "TAIP" goto pradzia
if "%ats%" == "t" goto pradzia
if "%ats%" == "T" goto pradzia
if "%ats%" == "ne" goto pabaiga
if "%ats%" == "NE" goto pabaiga
if "%ats%" == "n" goto pabaiga
if "%ats%" == "N" goto pabaiga
cls
goto arzaistidar

:pabaiga