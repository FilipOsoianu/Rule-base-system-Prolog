%To Start the system type start.
% Name : - Chamara M. Dodandeniya

:- use_module(library(jpl)).
	
	start :- pt.

    hypothesis(lonnie) :- lonnie, !.
    hypothesis(jora) :- jora, !.
    hypothesis(marvin) :-marvin, !.
    hypothesis(omar) :- omar, !.
    hypothesis(nency) :-nency, !.
	hypothesis("IDK").

    oval_iris :- verify("He has oval iris y/n) ?").
    nose :- verify("He has nose y/n) ?").
    wear_spacesuite :- verify("He wear spacesuite y/n) ?").
    wear_sandals :- verify("He wear sandals y/n) ?").
    wear_hat :- verify("He wear hat y/n) ?").
    bag :- verify("He has bag y/n) ?").
	piercing :- verify("He has piercing y/n) ?").
    two_legs :- verify("He has 2 legs (y/n) ?").
    four_legs :- verify("He has 4 legs (y/n) ?").
    two_arms :- verify("He has 2 arms y/n) ?").
    no_arms :- verify("He has 0 arms y/n) ?").
    four_eyes :- verify("He has 4 eyes y/n) ?").
    two_eyes :- verify("He has 2 eyes y/n) ?").
    wear_watch :- verify("(e wear a watch y/n) ?").


	color_blind :- four_eyes,
						oval_iris.

	walker :- two_legs,
					two_arms.
					
	runner :- four_legs,
					no_arms.

	jumper :- walker,
				verify("He has tail? y/n ? ").

	air_breather :- wear_spacesuite, 
						nose.

	lonnie :- walker,
			color_blind,
			wear_sandals.
	
	jora :- air_breather,
			wear_watch,
			walker.

	marvin :-  runner,
			color_blind,
			wear_hat.    

	omar :-  jumper,
			air_breather,
			bag.


	nency :- runner,
			color_blind,
			piercing.	



	
response(Reply) :-
        read(Reply),
        write(Reply),nl.

		
ask(Question) :-
		write(' '),write(''),write(Question),
		
		interface('','',Question),
		nl.
		
:- dynamic yes/1,no/1.		
	
verify(S) :-
		(yes(S) 
			->
				true ;
		(no(S)
			->
				fail ;
		ask(S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


pt :- 
		hypothesis(Turist),
		interface3(' ','Your turist probably is - ',Turist,'.'),
		write(' '),write('Your turist probably is - '),write(Turist),write('.'),undo,end.

end :-
		write('End'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- Turist detect system ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- Turist detect system ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	
help :- write("To start the expert system please type 'start.' and press Enter key").