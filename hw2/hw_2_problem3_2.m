addpath(genpath('~/Desktop/HMMall'))

start_probs = [0.25 0.25 0.25 0.25];
trans_mat = [5/6.0 0.0 0.0 1/11.0 ;
             1/6.0 10/11.0 0.0 0.0 ;
             0.0 1/11.0 6/7.0 0.0 ;
             0.0 0.0 1/7.0 10/11.0];
trans_mat = transpose(trans_mat);

% trans_mat = [0.8 0.2 0.0 0.0 ; 0.0 0.9 0.1 0.0 ; 
%              0.0 0.0 5/6.0 1/6.0 ; 0.1 0.0 0.0 0.9];
emi_mat = [0.1 0.1 0.4 0.4 ; 0.1 0.2 0.3 0.4 ;
           0.7 0.1 0.1 0.1 ; 0.25 0.25 0.25 0.25];

T = 200;
nex = 1;

% generate sequence X and labeling P
[X, P] = dhmm_sample(start_probs, trans_mat, emi_mat, nex, T);

% compute labeling E for sequence X
B = multinomial_prob(X, emi_mat);
[E] = viterbi_path(start_probs, trans_mat, B);

% shitty string formatting
X = mat2str(X);
P = mat2str(P);
E = mat2str(E);

X(X=='1')='A';
X(X=='2')='T';
X(X=='3')='C';
X(X=='4')='G';

P(P=='1')='P';
P(P=='2')='C';
P(P=='3')='A';
P(P=='4')='I';

E(E=='1')='P';
E(E=='2')='C';
E(E=='3')='A';
E(E=='4')='I';

display(X);
display(P);
display(E);


