--[[ @i18n question ]]
local _t = require("i18n").context("question")

module("STRING_TABLE")


KIKI_DICTIONARY_INDEX = _t"问题%d"
KIKI_DICTIONARY_RIGHT = _t"恭喜，您回答正确！"
KIKI_DICTIONARY_WRONG = _t"抱歉，您答错了。"
KIKI_HELP_WORDS		  = _t"求解：%s"
KIKI_COMPLETE_HINT	  = _t"恭喜恭喜，您已完成了今天的答题，点击下方按钮领取奖励任务并关闭本界面！"
KIKI_BUTTON_GETAWARD  = _t"领取奖励"
