%-----------------------------Main Setting-----------------------%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report}[by pastglory]

% 中文和英文相关配置
% 主要方便使用一个配置项决定中英文
% 避免手动注释包带来的开销（中英文环境差别太大）
% 最终效果：
\newif\ifChinese
\newif\ifEnglish
\DeclareOption{zh}{\Chinesetrue\Englishfalse} % \Chinesetrue 把Chinese设为true以供 \ifChinese判断
\DeclareOption{en}{\Chinesefalse\Englishtrue}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

\LoadClass[12pt]{article}

\ifChinese
    \RequirePackage{ctex} % 中文
    \setCJKmainfont[AutoFakeBold=true]{STSong}
    \setCJKfamilyfont{hwti}{STHeitiSC-Light} % 给系统中的字体取个别名
    \newcommand*{\hwti}{\CJKfamily{hwti}}
\else
\fi

% use packages
\RequirePackage{cite} % 引用
\RequirePackage[colorlinks, linkcolor=blue, citecolor=black, urlcolor=blue]{hyperref} % 超链接
\RequirePackage{fontspec} % 调整字体
\RequirePackage{graphicx} % 插入图片
\RequirePackage{float} % 设置图片浮动位置
\RequirePackage{subfigure} % 插入多图时用子图显示

% ref
\bibliographystyle{IEEEtran} % 引用格式

%TODO : Change for my preference
%----------------------------Font & Size--------------------------%
\setmainfont{TimesNewRomanPSMT}
% \setsansfont{} % 西文无称线字体
% \setmonofont{} % 西文等宽字体
% \setmathfont{} % 数学公式字体

\newcommand*{\iuhc}{\fontsize{42pt}{\baselineskip}\selectfont}     %初号
\newcommand*{\xniu}{\fontsize{36pt}{\baselineskip}\selectfont} %小初号
\newcommand*{\yihc}{\fontsize{28pt}{\baselineskip}\selectfont}      %一号
\newcommand*{\erhc}{\fontsize{21pt}{\baselineskip}\selectfont}      %二号
\newcommand*{\xner}{\fontsize{18pt}{\baselineskip}\selectfont}  %小二号
\newcommand*{\sjhc}{\fontsize{15.75pt}{\baselineskip}\selectfont}  %三号
\newcommand*{\sihc}{\fontsize{14pt}{\baselineskip}\selectfont}%     四号
\newcommand*{\xnsi}{\fontsize{12pt}{\baselineskip}\selectfont}  %小四号
\newcommand*{\wuhc}{\fontsize{10.5pt}{\baselineskip}\selectfont}    %五号
\newcommand*{\xnwu}{\fontsize{9pt}{\baselineskip}\selectfont}   %小五号
\newcommand*{\lqhc}{\fontsize{7.875pt}{\baselineskip}\selectfont}  %六号
\newcommand*{\qihc}{\fontsize{5.25pt}{\baselineskip}\selectfont}    %七号
%------------------------------标题名称中文化-----------------------------%
% \renewcommand\abstractname{\hwti 摘\ 要}
% \renewcommand\refname{\hwti 参考文献}
% \renewcommand\figurename{\hwti 图}
% \renewcommand\tablename{\hwti 表}
%------------------------------定理名称中文化-----------------------------%
% \newtheorem{dingyi}{\hei 定义~}[section]
% \newtheorem{dingli}{\hei 定理~}[section]
% \newtheorem{yinli}[dingli]{\hei 引理~}
% \newtheorem{tuilun}[dingli]{\hei 推论~}
% \newtheorem{mingti}[dingli]{\hei 命题~}
% \newtheorem{lizi}{{例}}

\linespread{1.3} % 配置行间距