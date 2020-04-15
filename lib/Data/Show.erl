%%---------------------------------------------------------------------------
%% |
%% Module      :  Show
%% Copyright   :  (c) 2020 EMQ Technologies Co., Ltd.
%% License     :  BSD-style (see the LICENSE file)
%%
%% Maintainer  :  Feng Lee, feng@emqx.io
%%                Yang M, yangm@emqx.io
%% Stability   :  experimental
%% Portability :  portable
%%
%% The Show Module.
%%
%%---------------------------------------------------------------------------
-module('Show').

-export([ showInt/1
        , showFloat/1
        , showNum/1
        , showChar/1
        ]).

%% showInt :: Integer -> String
-spec(showInt(integer()) -> string()).
showInt(I) -> integer_to_list(I).

%% showFloat :: Number -> String
-spec(showFloat(float()) -> string()).
showFloat(F) ->
   erlang:float_to_list(F, [{decimals,precision(abs(F), 0)}]).

%% showNumber :: Number -> String
-spec(showNum(number()) -> string()).
showNum(N) when is_integer(N) ->
    showInt(N);
showNum(N) when is_float(N) ->
    showFloat(N).

%% showChar :: Char -> String
-spec(showChar(char()) -> string()).
showChar(C) -> [C].

precision(A, P) ->
    if A == trunc(A) -> P;
       true -> precision(A*10.0, P+1)
    end.
