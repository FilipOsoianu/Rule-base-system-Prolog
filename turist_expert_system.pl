%To Start the system type start.

start :- hypothesis(Tourist),
      write('Tourist is: '),
      write(Tourist),
      nl,
      undo.

    hypothesis(lonnie) :- lonnie, !.
    hypothesis(jora) :- jora, !.
    hypothesis(marvin) :-marvin, !.
    hypothesis(omar) :- omar, !.
    hypothesis(nency) :-nency, !.
	hypothesis("IDK").

	
	lonnie :- walker,
			color_blind,
			blue_skin,
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
	blue_skin :- verify("He has blue skin y/n ? ").
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



	
ask(Question) :-
    write(' '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to verify something */
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