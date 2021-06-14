

require'snippets'.snippets = {
  _global = {
    todo = "TODO(ashkan): ";

    uname = function() return vim.loop.os_uname().sysname end;
    date = os.date;
    epoch = "${=os.time()}";
    epoch = function() return os.time() end;
    note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]];
    note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
  };
  lua = {
    req = [[local ${2:$1} = require '$1']];
    ["for"] = "for ${1:i}, ${2:v} in ipairs(${3:t}) do\n$0\nend";
    ["for"] = [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  c = {
    ["#if"] = [[
#if ${1:CONDITION}
$0
#endif // $1
]];

    guard = [[
#ifndef AK_${1:header name|S.v:upper():gsub("%s+", "_")}_H_
#define AK_$1_H_

// This is a header for $1

int ${1|S.v:lower():gsub("%s+", "_")} = 123;

$0

#endif // AK_${|S[1]:gsub("%s+", "_")}_H_
]];

    inc = [[#include "${=vim.fn.expand("%:t"):upper()}"]];
    user_input = [[hey? ${-1=vim.fn.input("what's up? ")} = ${-1}]];
  };
}

local snippets = require'snippets'
local U = require'snippets.utils'
snippets.snippets = {
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']];
    func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]];
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]];
  };
  _global = {
    copyright = U.force_comment [[Copyright (C) Ashkan Kiani ${=os.date("%Y")}]];
  };
}
