#ifndef LIBFTASM_H
# define LIBFTASM_H
# include <strings.h>

//part I
void	ft_bzero(void *s, size_t n);
int	ft_isalpha(int c);
int	ft_isdigit(int c);
int	ft_isalnum(int c);
int	ft_isascii(int c);
int	ft_isprint(int c);
char	*ft_strcat(char *dst, const char *src);
int	ft_toupper(int c);
int	ft_tolower(int c);
int	ft_puts(const char *s);

//part II
size_t	ft_strlen(char *str);
void	*ft_memset(void *s, int c, size_t n);
void	*ft_memcpy(void *dest, const void *src, size_t n);
char	*ft_strdup(const char *s);

//part III
void	ft_cat(int fd);

//bonus
void ft_putchar(char c);

#endif