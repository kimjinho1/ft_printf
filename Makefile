# **************************************************************************** #
#                                                                              # 
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jinhokim <jinhokim@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 20:08:11 by jinhokim          #+#    #+#              #
#    Updated: 2020/11/02 14:19:02 by jinhokim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
FILES = ft_printf.c \
		print_nbr.c \
		print_str.c \
		print_char.c \
		utils1.c \
		utils2.c

CC		= gcc
CFLAGS	= -Wall -Werror -Wextra

OBJ		= ${FILES:.c=.o}

RM		= rm -rf

.c.o:
		${CC} ${CFLAGS} -c $< -o ${<:.c=.o}

$(NAME)	: ${OBJ}
			ar rc ${NAME} ${OBJ}

all : ${NAME}

clean :
			${RM} *.o 

fclean : clean
			${RM} ${NAME}

re : fclean all

.PHONY : all clean fclean re
