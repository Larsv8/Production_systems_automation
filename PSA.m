%%  い  LXX  い  Groover section 2.4  い  p. 53-57
Q_j = 1;    % [products/yr] % Annual quantity of style j
P = 1;                      % Total number of different product styles
Q_f = P * Q;                % Annual quantity of all products made in the factory

j = [1,2,3,4,]; % Number indicating the specific part

n_pj = 1;   % [pc/product] % Number of parts in a product 
n_ojk = 1;                 % Number of processing operations for each part k, summed over the number of parts in product j

n_pf = sum(Q_j * n_pj, j, 1, P)                   % [pc/yr]  % total numer of parts made in the factory
n_of = sum(Q_j, j, 1, P) * sum(n_ojk, k, 1, n_pj) % [ops/yr] % total number of operation cycles performed in the facotry 

% See equation 2.6 to 2.10 for different approaches to find these values if
% a reverse sitatuion is given.

%%  い  L06  い  Groover chapter 3  い  p. 63-66

% Cycle time
Q = 1;                             % Quantity
T_o = 1;                % [min/pc] % Time of the actual processing/assembly operation
T_h = 1;                % [min/pc] % Handling time
T_th = 1;               % [min/pc] % Average tool handling time
T_su = 1;               % [min/pc] % Setup time to prepare the machien to produce a part/batch
T_c = T_o + T_h + T_th; % [min/pc] % Cycle time for a part/batch

% Job shop production: (Q is close to 1):
T_p = T_su + T_c;       % [min/pc]    % Average production time per work unit
R_p = 60 / T_p;         % [pc/hr]     % Hourly production rate
% Sequential batch processing:
T_b = T_su + Q * T_c;   % [min/batch] % Batch processing time
T_p = T_b / Q;                        % Average production time per work unit
% Simultaneous batch processing:
T_b = T_su + T_c        % [min/batch) % Batch processing time
T_p = T_b / Q;                        % Average production time per work unit

% For both batch processing types:
R_c = 60 / T_c;         % [pc/hr]     % Operation cycle rate of the machine - as Q becomes very large (T_su / Q) becomes small hence the change to T_c from T_p

% Flow line production:
T_c = T_r + Max(T_o);   % [min/cycle] % Cycle time of production line where T_o is the bottle neck station
R_c = 60 / T_c;

%%  い  L06  い  Groover chapter 3

% Availability p. 66-67
MTBF = 1;                   % [hr] % Mean time between failures
MTTR = 1;                   % [hr] % Mean time to repair
A = (MTBF - MTTR) / (MTBF); % [%]  % Availability

% Production Capacity p. 67-69
n = 1;                             % Number of machines
H_pc = 1;            % [hr/period] % The number of hours in the period being used to measure production/plant capacity
R_p = 1;                           % Average production rate from previous
PC = n * H_pc * R_p;               % Production/plant capacity for a defined period

% Utilization p. 70-71
% U = (actual output) / (designed capacity);  % Utilization found in slide 14
% E = (actual output) / effective capacity);  % Efficiency found in slide 14
% Workload in eq 3.17, covered in lecture 7

% Manufacturing Lead Time (through-put-time) p. 72-73 
% is the amount of inventory located in the plant as partially or complted product
n_o = 1;                                      % number of operations
T_no = 1;                                     % Non-operation time
MLT = n_o * (T_su + (Q * T_c) + T_no); % [hr] % Manufacturing lead time for all parts or products in the plant


% Work-in-process p. 74
R_pph = 1;          % [pc/hr] % Hourly plant production rate
WIP = R_pph * (MLT) % [pc]    % Work-in-process of parts or products in the plant


% Variable cost p. 76
FC = 1;            % [$/yr]  % Fixed annual cost
VC = 1;            % [$/pc]  % Variable cost
Q = 1;             % [pc/yr] % Annual quantity produced

TC = FC + VC * (Q) % [$/yr]  % Total annual cost


% Overhead p. 77-79
FOHC = 1;          % [$/yr] % Annual factory overhead costs
DLC = 1;           % [$/yr] % Annual direct labor costs
FOHR = FOHC / DLC; % [%]    % Factory overhead rate

COHC = 1;          % [$/yr] % Annual corporate overhead costs
DLC = 1;           % [$/yr] % Annual direct labor costs
COHR = COHC / DLC; % [%]    % Corporate overhead rate


% Cost of Equipment Usage p. 80-81
C_L = 1;    % [$/hr] % Direct labor wage rate
FOHR_L = 1;          % Factory overhead rate for labor
C_m = 1;    % [$/hr] % Machine hourly rate
FOHR_m = 1;          % Factory overhead rate applicable to the machine

C_o = C_L * (1 + FOHR_L) + C_m * (1 + FOHR_m); % [$/hr] % Hourly rate to operate the machine


% Cost of Manufactured Part (standard unit cost) p. 82
C_oi = 1; % [$/min]  % Cost rate to perform unit operation i
T_pi = 1; % [min/pc] % Production time of operation i
C_ti = 1; % [$/pc]   % Cost of any tooling used in operation i

C_ui = C_oi * T_pi + C_ti; % Cost of each unit operation i 

C_m = 1; %[$/pc] % Cost of starting material
n_o = 1;         % All unit operations in the sequence
i = [1,2,3,4,];  % Number indicating the individual operation in the sequence

C_pc = C_m + sum(C_ui, i, 1, n_o) % [$/pc] % Cost per piece



%%  い  L07  い  Groover chapter 14

% Parts Storage and Automatic Parts Transfer: p. 386
n_pc = 1;        % [pc]     % Number of parts that can be stored
T_c = 1;         % [min/pc] % Cycle time of a part held in the parts-storage system
UT = n_pc * T_c; % [min]    % Unattended time of operation of the manufacturing cell (T_cj if for each operation)


% Number of workstations needed: p. 395
WL = 1; % [hr/period]      % Worklaod to be accomplished during the period of interest
AT = 1; % [hr/period/cell] % Available time on one cell in the same period (AT = Availability * actual hours per period )
n = WL / AT;               % Number of cells or workstations


% Workload: p. 395
TT_su = sum(T_suj, dim); % Total setup time for all part styles included in the workload (T_suj is the individual part setup time)
q_j = 1;                 % Fraction defect rate
Q_oj = 1;                % Original or starting quantity
Q_j = Q_oj * (1 - q_j)   % Quantity of good units made in the process

WL = TT_su + sum((Q_j * T_cj)/(1 - q_j), dim); % Workload 


% い Single-model assembly lines only


% Required hourly production rate: p. 414-415
D_a = 1;                        % [units/yr]  % Annual demand for the single product to be made on the line
W_a = 1;                        % [week/yr]   % Number of weeks per year
S_w = 1;                        % [shifts/wk] % Number of shifts per week
H_sh = 1;                       % [hr/shift]  % Number of hours per shift

R_p = D_a / (W_a * S_w * H_sh); % [units/hr]  % Average hourly production rate

% Cycle time can be derived from this by taking the effeciency:
T_c = (60 * E) / R_p;           % [min/cycle] % Cycle time, constant 60 minutes because R_p is in hours.


% Repositioning efficiency and service time: p. 416-417
% T_c used from earlier
T_r = 1; % [min/cycle] % Repositioning time (Assumed to be same for all stations)
T_s = T_c - T_r; % [min/cycle] % Service time among all stations

E_r = (T_c - T_r) / T_c; % Repositioning efficency


% Theoretical number of workers p. 416
w = 1; % Theoretical amount of workers
T_wc = 1; % Total work content time
% minimum integer >= greater or equal to ...
w = T_wc / T_c


% Line balancing problem
% Optimization
% Line balacing efficiency
% Slide 25-31, p. 417 - 429



%%  い  L14  い  Groover chapter 25

% Cost of holding invetory: p. 756
h = 1;           % [rate/yr]  % Holding cost rate (interest + storage cost rate)
C_pc = 1;        % [$/pc]     % Unit cost of the item
C_h = h * C_pc;  % [$/pc/yr]  % Carrying or holding cost

% Setup cost: p. 757
T_su = 1;        % [hr/setup] % Setup time/changeover between batches from lecture 6, chapter 3.
C_dt = 1;        % [$/hr]     % Cost rate of machine downtime during the changeover
C_su = 1;        % [$/setup]  % Setup cost and/or ordering cost for an order

% Inventory control: p. 755-757
Q = 1;           % [pc/order] % Order quantity
D_a = 1;         % [pc/yr]    % Annual demand for the item

TIC = ((C_h * Q) / 2) + ((C_su * D_a) / Q) % [$/yr] % Total annual invetory cost (holding cost plus ordering cost)

% Economic order quantity EOQ:
EOQ = sqrt((2 * D_a * C_su) / C_h)         % [pc/batch or pc/order] % Economic order quantity (number of parts to be produced per batch)



%%  い  L14  い  Groover chapter 26

% Takt Time: p. 784-785
EOT = 1;             % [min]    % Effective daily operating time
Q_dd = 1;            % [pc]     % Daily quantity of units demanded
T_takt = EOT / Q_dd; % [min/pc] % Takt time


