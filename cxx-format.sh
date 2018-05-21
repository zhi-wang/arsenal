#!/bin/bash

_config1="{ \
BasedOnStyle: WebKit, \
ColumnLimit: 80, \
Language: Cpp, \
Standard: Cpp11, \
TabWidth: 8, \
UseTab: Never, \
\
AccessModifierOffset: -2, \
AlignAfterOpenBracket: DontAlign, \
AlignConsecutiveAssignments: false, \
AlignConsecutiveDeclarations: true, \
AlignEscapedNewlines: Left, \
AlignOperands: false, \
AlignTrailingComments: true, \
\
AllowAllParametersOfDeclarationOnNextLine: false, \
BinPackArguments: true, \
BinPackParameters: true, \
\
AllowShortBlocksOnASingleLine: true, \
AllowShortCaseLabelsOnASingleLine: false, \
AllowShortFunctionsOnASingleLine: All, \
AllowShortIfStatementsOnASingleLine: false, \
AllowShortLoopsOnASingleLine: false, \
\
AlwaysBreakAfterReturnType: None, \
AlwaysBreakBeforeMultilineStrings: true, \
AlwaysBreakTemplateDeclarations: true, \
\
BreakBeforeBraces: Custom, \
BraceWrapping: { \
  AfterClass: false, \
  AfterControlStatement: false, \
  AfterEnum: false, \
  AfterFunction: true, \
  AfterNamespace: false, \
  AfterStruct: false, \
  AfterUnion: false, \
  AfterExternBlock: false, \
  BeforeCatch: false, \
  BeforeElse: false, \
  IndentBraces: false, \
  SplitEmptyFunction: false, \
  SplitEmptyRecord: false, \
  SplitEmptyNamespace: false \
}, \
BreakBeforeBinaryOperators: All, \
BreakBeforeInheritanceComma: true, \
BreakBeforeTernaryOperators: true, \
BreakConstructorInitializers: BeforeComma, \
BreakStringLiterals: true, \
\
CompactNamespaces: true, \
ConstructorInitializerAllOnOneLineOrOnePerLine: false, \
ConstructorInitializerIndentWidth: 2, \
ContinuationIndentWidth: 2, \
Cpp11BracedListStyle: true, \
\
DerivePointerAlignment: false, \
FixNamespaceComments: true, \
IncludeBlocks: Preserve, \
\
IndentCaseLabels: false, \
IndentPPDirectives: AfterHash, \
IndentWidth: 2, \
IndentWrappedFunctionNames: false, \
KeepEmptyLinesAtTheStartOfBlocks: false, \
MaxEmptyLinesToKeep: 1, \
NamespaceIndentation: Inner, \
\
PointerAlignment: Left, \
ReflowComments: true, \
SortIncludes: true, \
SortUsingDeclarations: true, \
\
SpaceAfterCStyleCast: false, \
SpaceAfterTemplateKeyword: false, \
SpaceBeforeAssignmentOperators: true, \
SpaceBeforeParens: ControlStatements, \
SpaceInEmptyParentheses: false, \
SpacesBeforeTrailingComments: 1, \
SpacesInAngles: false, \
SpacesInCStyleCastParentheses: false, \
SpacesInContainerLiterals: false, \
SpacesInParentheses: false, \
SpacesInSquareBrackets: false \
}"

if [ ! -z $(which clang-format-6.0) ]; then
  _prog=$(which clang-format-6.0)
elif [ ! -z $(which clang-format) ]; then
  _prog=$(which clang-format)
else
  echo clang-format not found!
  exit
fi

_version=$($_prog -version | awk '{print $3}') # e.g. 6.0.0
_version="${_version%%.*}" # 6.0.0 -> 6
if [ $_version -lt 6 ]; then
  echo Must use clang-format version 6.0.0+
  exit
fi

if [ "$#" -gt 0 ]; then
  echo format source files
  for _x in "$@"; do
    echo "$_x"
    $_prog -style="$_config1" -i $_x
  done
fi
