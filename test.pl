
% transitions from node endif1
n_endif1(Varw, Varx, Vary, Varz) :- Varw_P - Varw -1 = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz -10 = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,1 + Varw - Varx >= 0, n_while(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node exit

% transitions from node if1
n_if1(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx -1 = 0,Vary_P - Vary -100 = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).
n_if1(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if2(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node if2
n_if2(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if3(Varw_P, Varx_P, Vary_P, Varz_P).
n_if2(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if4(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node if3
n_if3(Varw, Varx, Vary, Varz) :- Varx -4 >= 0,Varw_P - Varw = 0,Varx_P - Varx -1 = 0,Vary_P - Vary -1 = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).
n_if3(Varw, Varx, Vary, Varz) :- 4 - Varx > 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node if4
n_if4(Varw, Varx, Vary, Varz) :- 100 * Varx - Varz > 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).
n_if4(Varw, Varx, Vary, Varz) :- Vary -10 * Varw > 0,Varz -100 * Varx >= 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P + Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).
n_if4(Varw, Varx, Vary, Varz) :- 10 * Varw - Vary >= 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_endif1(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node if5
n_if5(Varw, Varx, Vary, Varz) :- 4 - Varx > 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_exit(Varw_P, Varx_P, Vary_P, Varz_P).
n_if5(Varw, Varx, Vary, Varz) :- Varx -4 >= 0,Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if5_assert1(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node if5_assert1
n_if5_assert1(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,-4 + Varx >= 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_exit(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node init
n_init(Varw, Varx, Vary, Varz) :- Varw_P = 0,Varx_P = 0,Vary_P = 0,Varz_P = 0, n_while(Varw_P, Varx_P, Vary_P, Varz_P).

% transitions from node while
n_while(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if1(Varw_P, Varx_P, Vary_P, Varz_P).
n_while(Varw, Varx, Vary, Varz) :- Varw_P - Varw = 0,Varx_P - Varx = 0,Vary_P - Vary = 0,Varz_P - Varz = 0,10 * Varw - Varz = 0,100 * Varx - Vary >= 0,Varw - Varx >= 0, n_if5(Varw_P, Varx_P, Vary_P, Varz_P).
