freq = 437.15*1e6;
ant = design(yagiUda, freq);
width = cylinder2strip(4e-3);
ant.Exciter = dipole('Length', 0.3185, 'Width', width, 'TiltAxis', [0 1 0], 'Tilt', 90);
ant.Exciter.Conductor = metal('Aluminium');
% Conductor Thickness?
ant.NumDirectors = 5;
ant.DirectorLength = [0.2891, 0.2853, 0.2818, 0.2786, 0.2756];
ant.DirectorSpacing = [0.0514, 0.1235, 0.1475, 0.1715, 0.192];
ant.ReflectorLength = 0.3322;
ant.ReflectorSpacing = 0.137;
ant.Conductor = metal('Aluminium');
% Show
figure;
show(ant)
pattern(ant, freq);
figure;
patternAzimuth(ant, freq);
figure;
patternElevation(ant, freq);
dx = 250e6;
step = 1e6;
lo = freq - dx;
hi = freq + dx;
figure;
impedance(ant, lo:step:hi);
figure;
rfplot(sparameters(ant,lo:step:hi))

