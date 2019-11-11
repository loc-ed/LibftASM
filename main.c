#include "libftasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <ctype.h>
#include <string.h>

void    is_ok(int ok)
{
    ok ? printf("\033[0;32m\033[1m.\033[0m") : printf("\033[0;31m\033[1mF\033[0m");
}

int	check_is(int ret, int (*mine)(int c), int c, int (*real)(int c))
{    
    if (mine(c) == real(c) || (mine(c) == 1 && real(c) != 0))
        is_ok(1);
    else
    {        
        is_ok(0);
        printf("([%i] %i != %i)", c, mine(c),  real(c));
        ret++;
    }
    return (ret);
}

int iter_check_is(char *title, char *str, int ret, int (*mine)(int c), int (*real)(int c))
{
    int i = 0;

    printf("\n\n%s\n", title);
    for (i = 0 ; i < (int)strlen(str) ; i++)
        ret = check_is(ret, mine, str[i], real);
    return (ret);
}

int is_to_something(int ret)
{
    char str[] = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~ \t\n\r\x0b\x0c";
    ret = iter_check_is("ft_isalpha", str, ret, ft_isalpha, isalpha);
    ret = iter_check_is("ft_isdigit", str, ret, ft_isdigit, isdigit);
    ret = iter_check_is("ft_isalnum", str, ret, ft_isalnum, isalnum);
    ret = iter_check_is("ft_isascii", str, ret, ft_isascii, isascii);
    ret = iter_check_is("ft_isprint", str, ret, ft_isprint, isprint);
    ret = iter_check_is("ft_toupper", str, ret, ft_toupper, toupper);
    ret = iter_check_is("ft_tolower", str, ret, ft_tolower, tolower);
    return (ret);
}

int strlen_arg(int ret, char *str)
{
    if (ft_strlen(str) == strlen(str))
        is_ok(1);
    else
    {
        is_ok(0);
	    ret++;
    }
    return (ret);
}

int check_strlen(int ret)
{
    printf("\n\nft_strlen\n");
    ret = strlen_arg(ret, "123") + ret;
    ret = strlen_arg(ret, "") + ret;
    ret = strlen_arg(ret, "1234567890") + ret;
    ret = strlen_arg(ret, "1") + ret;
    ret = strlen_arg(ret, "\0") + ret;
    return (ret);
}

int check_bzero(int ret)
{
    char *ptr = NULL;
    int i = 50;
    printf("\n\nft_bzero\n");    
    ptr = (char *)malloc(sizeof(char) * i);
    ft_bzero(ptr, i);
    while (--i >= 0)
    {
        if (ptr[i] == 0)
            is_ok(1);
        else
        {
            is_ok(0);
            ret++;
        }
    }    
    return (ret);
}

int check_memset(int ret)
{
    char *ptr = NULL;
    int i = 50;
    printf("\n\nft_memset\n");
    ptr = (char *)malloc(sizeof(char) * i);
    ft_memset(ptr, 0, i);
    while (--i >= 0)
    {
        if (ptr[i] == 0)
            is_ok(1);
        else
        {
            is_ok(0);
            ret++;
        }
    }    
    return (ret);
}

int check_strcat(int ret)
{
    char *src = NULL;
    char *dest = NULL;
    int i = 5;
    int j = 0;
    printf("\nft_strcat\n");
    if ((src = (char *)malloc(sizeof(char) * i)) && ((dest = (char *)malloc(sizeof(char) * (i * 2)))))
    {
        while (j < i)
        {
            src[j] = 'z';
            dest[j] = 'a';
            j++;
        }
        dest = ft_strcat(dest, src);
        j = 0;
        while (j < i * 2)
        {
            if ((j < i && dest[j] == 'a') || dest[j] == 'z')
                is_ok(1);
            else
            {
                is_ok(0);
                ret++;
            }
            j++;
        }
        return (ret);
    }
    return (2);
}

int check_memcpy(int ret)
{
    char src[] = "abc";
    char dest[] = "rst";
    int i = 0;
    printf("\n\nft_memcpy\n");
    ft_memcpy(dest, src, ft_strlen(src));
    while (i < (int)ft_strlen(src))
    {
        if (dest[i] == src[i])
            is_ok(1);
        else
        {
            is_ok(0);
            ret++;
        }
        i++;
    }
    return (ret);
}

int check_strdup(int ret)
{
    char *dest = NULL;
    int i = 3;
    int j = 0;
    char src[i];
    while (j < i)
    {
        src[j] = 'a';
        j++;
    }
    printf("\n\nft_strdup\n");
    dest = ft_strdup(src);
    j = 0;
    while (j < i)
    {
        if (dest[j] == src[j])
            is_ok(1);
        else
        {
            is_ok(0);
            ret++;
        }
        j++;
    }
    return (ret);
}

void check_puts(void)
{
    printf("\n\nft_puts\n");
    ft_puts("PUTS");
    ft_puts(NULL);
    printf("(null) == OK\n");
}

void call_cat(void)
 {
    int fd = 0;
    printf("\n\nft_cat\nHello World !");
    fd = open("hello.world", O_RDONLY);
    ft_cat(fd);    
 }

int main(void)
{
    int ret = 0;
    printf("Testing :");
    ret = is_to_something(ret);
    ret = check_strlen(ret);
    ret = check_bzero(ret);
    ret = check_memset(ret);
    check_puts();
    ret = check_strcat(ret);
    ret = check_memcpy(ret);
    ret = check_strdup(ret);
    call_cat();
    printf("\n\nfailed == %i\n", ret);
    return (ret > 0 ? 2 : 0);
}