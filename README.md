## Rule-base-system-Prolog

This is a rule base "expert" system that helps yout detect Tourists at Luna-city.

## How to run 
To run in docker:

```$ docker build -t prolog .```

```$ docker run -it prolog```

## Example of rule
	lonnie :- walker,
			color_blind,
			blue_skin,
			wear_sandals.
   	color_blind :- four_eyes,
					oval_iris.

  	walker :- two_legs,
				two_arms.
        
   	blue_skin :- verify("He has blue skin y/n ? ").
    wear_sandals :- verify("He wear sandals y/n) ?").
    two_legs :- verify("He has 2 legs (y/n) ?").
    two_arms :- verify("He has 2 arms y/n) ?").
      
## Example of usage

?- start.

  He has 2 legs (y/n) ?? y.
  
  He has 2 arms y/n) ?? |: y.
  
  He has 4 eyes y/n) ?? |: y.
  
  He has oval iris y/n) ?? |: y.
  
  He has blue skin y/n ? ? |: y.
  
  He wear sandals y/n) ?? |: y.

Tourist is: lonnie

true.


