# **************************************************************************** #
#                                                                              # 
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jinhokim <jinhokim@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/28 20:08:11 by jinhokim          #+#    #+#              #
#    Updated: 2022/09/07 15:17:58 by jinhokim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		= ./ft_printf.c \
			  ./utils.c ./print_char.c ./print_nbr.c ./print_str.c

OBJS		= $(SRCS:.c=.o)

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
RM			= rm -f

NAME		= libftprintf.a

.c.o :
	$(CC) $(CFLAGS) -c $< -o $(<:.c=.o) -I .

$(NAME) : $(OBJS)
	make all -C ./libft 
	cp ./libft/libft.a $(NAME)
	ar rcs $(NAME) $(OBJS)

all : $(NAME)

fclean : clean
	$(RM) $(NAME)
	make fclean -C ./libft

clean :
	$(RM) $(OBJS)
	make clean -C ./libft

re : fclean all
