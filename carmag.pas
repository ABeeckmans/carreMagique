program carmag;

uses crt;


TYPE
	tab = array of array of integer;

VAR
	carre : array of array of integer;
	x, y, tour, taille : integer;



procedure initialisation (VAR tableau : tab; VAR CONSTANTE : integer);

//BUT remplacer toutes les cases par des 0 afin de pouvoir les comparer
//ENTREE rien
//SORTIE le tableau initialisé

VAR
	i,j : integer;

BEGIN
	for i := 1 to CONSTANTE do
	begin
		for j := 1 to CONSTANTE do
		begin
			carre[i,j] := 0
		end;
	end;

END;


procedure position (VAR a, b, CONSTANTE : integer);

//BUT : positionner correctement le curseur

BEGIN
		if (a < CONSTANTE) AND (b > 1) THEN
		begin
			a := a + 1;
			b := b - 1;
		end
		else
		begin
			//cas ou on arrive sur le cote droit
			if (a = CONSTANTE) AND (b <> 1) THEN
			begin
				a := 1;
				b := b - 1;
			end
			else
			begin
				//cas ou on arrive au sommet
				if (a <> CONSTANTE) AND (b = 1) THEN
				begin
					a := a + 1;
					b := CONSTANTE;
				end
				else
				begin
					//coin droit
					if (a = CONSTANTE) and (b = 1) THEN
					begin
						a := 1;
						b := CONSTANTE;
					end;
				end;
			end;
		end;
END;

procedure reposition (VAR nb, CONSTANTE : integer);

BEGIN
	if (nb > 1) THEN
	begin
		nb := nb - 1;
	end
	else
	begin
		nb := CONSTANTE;
	end;
END;



procedure affichage (tableau : tab; CONSTANTE : integer);

VAR
	i,j : integer;

BEGIN
	for j := 1 to CONSTANTE do
	begin
		for i := 1 to CONSTANTE do
		begin
			write('|      ');
			if carre[i,j] < 10 THEN
			begin
				write('0');
			end;

			write(carre[i,j]);
		end;
		writeln;
	end;
END;




BEGIN

	clrscr;
	writeln('Veuillez entrer la taille du tableau');
	readln(taille);

	while (taille MOD 2 <> 1) do
	begin
		writeln('Veuillez entrer un nombre impair');
		readln(taille);
	end;

	setlength(carre, taille + 1, taille + 1);

	x := taille DIV 2 + 1;
	y := taille DIV 2;
	initialisation(carre, taille);


	carre[x, y] := 1;

	for tour := 2 to (taille*taille) do
	begin
		position(x,y,taille);


		if carre [x,y] = 0 THEN
		begin
			carre[x,y] := tour;
		end
		else
		begin
			while carre[x,y] <> 0 do
			begin
				reposition(x, taille);
				reposition(y, taille);
			end;
			carre[x,y] := tour;
		end;
		clrscr;
		affichage(carre, taille);
		delay(100);
	end;

	readln;




END.

