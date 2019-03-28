[cDirThis, cName, cExt] = fileparts(mfilename('fullpath'));

% Add src
addpath(genpath(fullfile(cDirThis, '..', 'src')));

clear
clc

cHost = '192.168.1.2';

device = controlbyweb.WebSwitch(...
    'cHost', cHost ...
);

device.isOnRelay1()
device.isOnRelay2()

device.turnOffRelay2()
device.turnOffRelay1()

fprintf('Should both return logical false \n');

device.isOnRelay2()
device.isOnRelay1()

device.turnOnRelay1()
device.turnOnRelay2()

fprintf('Should both return logical true \n');
device.isOnRelay1()
device.isOnRelay2()