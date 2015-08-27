#!/bin/sh
# Base16 Default - Shell color setup script
# Chris Kempson (http://chriskempson.com)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="00/00/00" # Base 00 - Black
color01="cc/00/00" # Base 08 - Red
color02="4e/9a/06" # Base 0B - Green
color03="c4/a0/00" # Base 0A - Yellow
color04="34/65/a4" # Base 0D - Blue
color05="75/50/7b" # Base 0E - Magenta
color06="06/98/9a" # Base 0C - Cyan
color07="d3/d7/cf" # Base 05 - White
color08="55/57/53" # Base 03 - Bright Black
color09="ef/29/29" # Base 08 - Bright Red
color10="8a/e2/34" # Base 0B - Bright Green
color11="fc/e9/4f" # Base 0A - Bright Yellow
color12="72/9f/cf" # Base 0D - Bright Blue
color13="ad/7f/a8" # Base 0E - Bright Magenta
color14="34/e2/e2" # Base 0C - Bright Cyan
color15="ee/ee/ec" # Base 07 - Bright White
color16="00/00/00" # Base 09
color17="00/00/5f" # Base 0F
color18="00/00/87" # Base 01
color19="00/00/af" # Base 02
color20="00/00/d7" # Base 04
color21="00/00/ff" # Base 06
color_foreground="ff/ff/ff" # Base 05
color_background="00/02/42" # Base 00
color_cursor="ff/ff/ff" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg d8d8d8 # forground
  printf $printf_template_custom Ph 181818 # background
  printf $printf_template_custom Pi d8d8d8 # bold color
  printf $printf_template_custom Pj 383838 # selection color
  printf $printf_template_custom Pk d8d8d8 # selected text color
  printf $printf_template_custom Pl d8d8d8 # cursor
  printf $printf_template_custom Pm 181818 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
