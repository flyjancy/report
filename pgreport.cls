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

\LoadClass{article}

% use packages
\RequirePackage{cite} % 引用
\RequirePackage{geometry} % 调整边距
\RequirePackage{titlesec} % 调整section
\RequirePackage{titletoc} % 调整section
\RequirePackage[colorlinks, linkcolor=black, citecolor=black, urlcolor=black]{hyperref} % 超链接
\RequirePackage{fontspec} % 调整字体
\RequirePackage{graphicx} % 插入图片
\RequirePackage{float} % 设置图片浮动位置
\RequirePackage{subfigure} % 插入多图时用子图显示
\RequirePackage{listings} % 代码环境
\RequirePackage{array} % 表格
\RequirePackage{longtable} % 长表格
\RequirePackage{multirow} % 支持在表格中跨行
\RequirePackage{fancyhdr} % 页眉页脚
\RequirePackage{xcolor} % 改变颜色
\RequirePackage{abstract} % 配置摘要
% 数学相关
\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}

% 中文相关的种种
% package, package config, newcommand
\ifChinese
    \RequirePackage{ctex} % 中文
    \RequirePackage{zhnumber} % 中文编号
    \setCJKmainfont[AutoFakeBold=true]{STSong} % 主要字体宋体
    \newCJKfontfamily{\hwti}{STHeitiSC-Light} 
    \renewcommand\abstractname{\sjhc{摘\ 要}}
    \renewcommand\refname{参考文献}
    \renewcommand\figurename{图}
    \renewcommand\tablename{表}
    \newtheorem{dingyi}{定义~}[section]
    \newtheorem{dingli}{定理~}[section]
    \newtheorem{yinli}[dingli]{引理~}
    \newtheorem{tuilun}[dingli]{推论~}
    \newtheorem{mingti}[dingli]{命题~}
    \newtheorem{lizi}{{例}}
    \newcommand{\thechinesesection}{\zhnum{section}}
    \titleformat{\section}{\centering\sjhc\bfseries}{第\thechinesesection 章}{0.5em}{}
    \titleformat*{\subsection}{\sihc\bfseries}
    \usepackage{titletoc}
    % 调整目录里的编号
    \titlecontents{section}[0pt]{\addvspace{1.5pt}\filright\bf}%
               {\contentspush{第\zhnumber{\thecontentslabel} 章\quad}}%
               {}{\titlerule*[8pt]{.}\contentspage}
\else
% 如果需要对英文单独设置，可以添加到这里
\fi

% ref style
\bibliographystyle{IEEEtran} % 引用格式

%----------------------------Font & Size--------------------------%
\setmainfont{TimesNewRomanPSMT}
% TODO
% \setsansfont{} % 西文无称线字体
% \setmonofont{SourceCodeProForPowerline-Regular} % 西文等宽字体
\setmonofont{CourierNewPSMT} % 西文等宽字体
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

% 页边距、段前/后距、行间距等距离设置
\geometry{a4paper, inner=3cm, outer=3cm, top=3cm, bottom=3cm, bindingoffset=0cm}
\titlespacing{\abstract}{0pt}{6pt}{12pt}
\titlespacing{\section}{0pt}{6pt}{12pt}      % 三个参数分别是左补白，段前距，段后距
\titlespacing{\subsection}{0pt}{3pt}{2pt}    % 三个参数分别是左补白，段前距，段后距
\titlespacing{\subsubsection}{0pt}{1pt}{1pt} % 三个参数分别是左补白，段前距，段后距
\linespread{1.391} % 配置行间距
\setlength\parindent{24pt} % 缩进2个12pt
\setlength{\parskip}{0pt} % 段间距和行间距一致
\setlength{\abstitleskip}{-6pt} %

% cite
\newcommand{\citeup}[1]{\textsuperscript{\cite{#1}}}


% 数学公式
\renewcommand\theequation{\arabic{section}-\arabic{equation}}

% 源代码环境
\lstset{
    breaklines,                                               % 自动换行
    basicstyle          =   \ttfamily,                        % 基本代码风格
    keywordstyle        =   \color{blue},                     % 关键字风格
    commentstyle        =   \ttfamily\itshape\color{gray},    % 注释的风格，斜体
    stringstyle         =   \ttfamily,                        % 字符串风格
    flexiblecolumns,                                          % 别问为什么，加上这个
    showspaces          =   false,                            % 是否显示空格，显示了有点乱，所以不现实了
    numberstyle         =   \zihao{-5}\ttfamily,              % 行号的样式，小五号，tt等宽字体
    showstringspaces    =   true,
    captionpos          =   t,                                % 这段代码的名字所呈现的位置，t指的是top上面
    frame               =   lrtb,                             % 显示边框
    xleftmargin         =   2em,                              % 左边间距
    xrightmargin        =   2em,                              % 右边间距
    aboveskip           =   1em                               % 段前距
}