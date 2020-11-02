/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jinhokim <jinhokim@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/11/02 13:55:55 by jinhokim          #+#    #+#             */
/*   Updated: 2020/11/02 15:03:35 by jinhokim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int			ft_putchar(char c)
{
	write(1, &c, 1);
	return (1);
}

int			ft_putstr(char *s)
{
	int	i;

	i = 0;
	while (s[i])
		write(1, &s[i++], 1);
	return (i);
}

void		init_flags(t_flags *flags)
{
	flags->minus = 0;
	flags->zero = 0;
	flags->width = 0;
	flags->prec = -1;
	flags->type = 0;
	flags->base = 10;
	flags->sign = 1;
}

int			ft_nbrlen(unsigned long long nbr, t_flags *flags)
{
	int		i;

	if (nbr == 0 && flags->prec != 0)
		return (1);
	i = 0;
	while (nbr)
	{
		i++;
		nbr /= flags->base;
	}
	return (i);
}

char		*ft_baseset(char type)
{
	if (type == 'u' || type == 'd' || type == 'i')
		return ("0123456789");
	else if (type == 'x' || type == 'p')
		return ("0123456789abcdef");
	else if (type == 'X')
		return ("0123456789ABCDEF");
	return (0);
}
