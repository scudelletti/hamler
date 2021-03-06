%%---------------------------------------------------------------------------
%% |
%% Module      :  Process
%% Copyright   :  (c) 2020 EMQ Technologies Co., Ltd.
%% License     :  BSD-style (see the LICENSE file)
%%
%% Maintainer  :  Feng Lee, feng@emqx.io
%%                Yang M, yangm@emqx.io
%% Stability   :  experimental
%% Portability :  portable
%%
%% The Process FFI module.
%%
%%---------------------------------------------------------------------------
-module('Process').

-include("../Foreign.hrl").

-compile(no_auto_import).

-export([ send/2
        , link/1
        , unlink/1
        , monitor/1
        , demonitor/1
        , demonitorFlush/1
        , register/2
        , unregister/1
        , whereis/1
        , setGroupLeader/2
        , exitProc/2
        , killProc/1
        , resume/1
        , suspend/1
        , yield/0
        ]).

-import('Maybe', [maybe/1]).

send(Pid, Msg) ->
  ?IO(ok(erlang:send(Pid, Msg))).

link(Pid) ->
  ?IO(ok(erlang:link(Pid))).

unlink(Pid) ->
  ?IO(ok(erlang:unlink(Pid))).

monitor(Pid) ->
  ?IO(erlang:monitor(process, Pid)).

demonitor(Ref) ->
  ?IO(ok(erlang:demonitor(Ref))).

demonitorFlush(Ref) ->
  ?IO(ok(erlang:demonitor(Ref, [flush]))).

register(Name, Pid) ->
  ?IO(ok(erlang:register(Name, Pid))).

unregister(Name) ->
  ?IO(ok(erlang:unregister(Name))).

whereis(Name) ->
  ?IO(maybe(erlang:whereis(Name))).

setGroupLeader(LeaderPid, Pid) ->
  ?IO(ok(erlang:group_leader(LeaderPid, Pid))).

exitProc(Pid, Reason) ->
  ?IO(ok(erlang:exit(Pid, Reason))).

killProc(Pid) ->
  ?IO(ok(erlang:exit(Pid, kill))).

resume(Pid) ->
  ?IO(ok(erlang:resume_process(Pid))).

suspend(Pid) ->
  ?IO(ok(erlang:suspend_process(Pid))).

yield() -> ?IO(ok(erlang:yield())).

-compile({inline, [ok/1]}).
ok(_) -> ok.
