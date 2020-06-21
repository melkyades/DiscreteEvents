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

![Position](docs/images/position.png?raw=true "Position") ![Acceleration](docs/images/acceleration.png?raw=true "Acceleration")

