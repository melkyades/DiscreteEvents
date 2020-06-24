# DiscreteEvents

to load, first load Roassal 2 (not really required unless you want run examples or display simulation results).

```
Metacello new
    baseline: 'Roassal3';
    repository: 'github://ObjectProfile/Roassal3:v0.9.1';
    load.
```

then load this repo.

```
repo := IceRepositoryCreator  new
	url: 'git@github.com:melkyades/DiscreteEvents.git';
	createRepository.

repo register.
(repo packageNamed: 'DiscreteEvents') load.
```

# Examples

```Smalltalk
test200FallingBall
	| ball chart1 chart2 |
	ball := FallingBall new.
	ball velocity initialC: 1; q: 1.
	ball position initialC: 0; q: 0.2.
	chart1 := EventDisplay new title: 'Position'; ylabel: 'm'.
	ball position forward: #output to: chart1 as: #receive:.
	chart2 := EventDisplay new title: 'Velocity'; ylabel: 'm/s'.
	ball velocity forward: #output to: chart2 as: #receive:.
	self simulate: ball physics for: 3 devsSeconds.
	chart1 plot.
	chart2 plot
```

Position | Velocity 
:-------------------------:|:-------------------------:
![Position](docs/images/position.png?raw=true "Position") |![Velocity](docs/images/velocity.png?raw=true "Velocity")

