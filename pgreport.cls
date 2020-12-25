%-----------------------------Main Setting-----------------------%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pgreport}[by pastglory]

% 中文和英文相关配置
% 主要方便使用一个配置项决定中英文
% 避免手动注释包带来的开销（中英文环境差别太大）
% 最终效果：
\newif\ifChinese
\newif\ifEnglish
\DeclareOption{zh}{\Chinesetrue\Englishfalse} % \Chinesetrue 把Chinese设为true以供 \ifChinese判断
\DeclareOption{en}{\Chinesefalse\Englishtrue}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article} % 将每一个未知的选项都传给 article 类，当然，zh和en是已知选项
}
\ProcessOptions\relax % 声明选项之后，处理选项

\LoadClass[12pt]{article}

% use packages
\RequirePackage{cite} % 引用
\RequirePackage{titlesec} % 调整section
\RequirePackage{titletoc} % 调整section
\RequirePackage[colorlinks, linkcolor=black, citecolor=black, urlcolor=black]{hyperref} % 超链接
\RequirePackage{fontspec} % 调整字体
\RequirePackage{graphicx} % 插入图片
\RequirePackage{float} % 设置图片浮动位置
\RequirePackage{subfigure} % 插入多图时用子图显示

% 中文相关的种种
% package, package config, newcommand
\ifChinese
    \RequirePackage{ctex} % 中文
    \RequirePackage{zhnumber} % 中文编号
    \setCJKmainfont[AutoFakeBold=true]{STSong} % 主要字体宋体
    \newCJKfontfamily{\hwti}{STHeitiSC-Light} 
    \renewcommand\abstractname{ \sjhc{摘\ 要}}
    \renewcommand\refname{ 参考文献}
    \renewcommand\figurename{ 图}
    \renewcommand\tablename{ 表}
    \newtheorem{dingyi}{ 定义~}[section]
    \newtheorem{dingli}{ 定理~}[section]
    \newtheorem{yinli}[dingli]{ 引理~}
    \newtheorem{tuilun}[dingli]{ 推论~}
    \newtheorem{mingti}[dingli]{ 命题~}
    \newtheorem{lizi}{{例}}
    \newcommand{\thechinesesection}{\zhnum{section}}
    \titleformat{\section}{\centering\sjhc\bfseries}{第\thechinesesection 章}{0.5em}{}
    \setcounter{tocdepth}{2}
    \setcounter{secnumdepth}{3}
    \usepackage{titletoc}
    \titlecontents{section}[0pt]{\addvspace{1.5pt}\filright\bf}%
               {\contentspush{第\zhnumber{\thecontentslabel} 章\quad}}%
               {}{\titlerule*[8pt]{.}\contentspage}
\else
\fi

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

\graphicspath{{./pic/}}

% titlesec settings
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\linespread{1.3} % 配置行间距
