function ControllerDesign(Control)

% Filter design
% Design low-pass filter (to remove high-frequency dynamics)
LP = zpk([], -Control.LPFCutOff, Control.LPFCutOff); % Make transfer function of the low-pass filter
LP_IPC = zpk([], -Control.LPFCutOff/5, Control.LPFCutOff/5); % Make transfer function of the low-pass filter
Notch = tf([1 2*.005*(2.3*2*pi) (2.3*2*pi)^2], [1 2*0.5*(2.3*2*pi) (2.3*2*pi)^2]); % Make transfer function of the low-pass filter

% Discretize the low-pass filter (for implementation reasons)
dLP = ss(c2d(LP, Control.DT)); % Discretization of the first order low-pass filter
dLP_IPC = ss(c2d(LP_IPC, Control.DT)); % Discretization of the first order low-pass filter
dNotch = ss(c2d(Notch, Control.DT)); % Discretization of the first order low-pass filter

assignin('base', 'LP', LP);
assignin('base', 'dLP', dLP);

assignin('base', 'LP_IPC', LP_IPC);
assignin('base', 'dLP_IPC', dLP_IPC);

assignin('base', 'Notch', Notch);
assignin('base', 'dNotch', dNotch);