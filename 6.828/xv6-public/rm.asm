
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int i;

  if(argc < 2){
   5:	be 01 00 00 00       	mov    $0x1,%esi
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 7d 08             	mov    0x8(%ebp),%edi
  14:	8b 45 0c             	mov    0xc(%ebp),%eax
  int i;

  if(argc < 2){
  17:	83 ff 01             	cmp    $0x1,%edi
  1a:	8d 58 04             	lea    0x4(%eax),%ebx
  1d:	7e 3a                	jle    59 <main+0x59>
  1f:	90                   	nop
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 ca 02 00 00       	call   2f4 <unlink>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 0f                	js     3d <main+0x3d>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 fe                	cmp    %edi,%esi
  36:	75 e8                	jne    20 <main+0x20>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  38:	e8 67 02 00 00       	call   2a4 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  3d:	8b 03                	mov    (%ebx),%eax
  3f:	c7 44 24 04 7a 07 00 	movl   $0x77a,0x4(%esp)
  46:	00 
  47:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4e:	89 44 24 08          	mov    %eax,0x8(%esp)
  52:	e8 a9 03 00 00       	call   400 <printf>
      break;
  57:	eb df                	jmp    38 <main+0x38>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  59:	c7 44 24 04 66 07 00 	movl   $0x766,0x4(%esp)
  60:	00 
  61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  68:	e8 93 03 00 00       	call   400 <printf>
    exit();
  6d:	e8 32 02 00 00       	call   2a4 <exit>
  72:	90                   	nop
  73:	90                   	nop
  74:	90                   	nop
  75:	90                   	nop
  76:	90                   	nop
  77:	90                   	nop
  78:	90                   	nop
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 45 08             	mov    0x8(%ebp),%eax
  86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  89:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  b6:	53                   	push   %ebx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	74 2d                	je     ee <strcmp+0x3e>
  c1:	0f b6 19             	movzbl (%ecx),%ebx
  c4:	38 d8                	cmp    %bl,%al
  c6:	74 0e                	je     d6 <strcmp+0x26>
  c8:	eb 2b                	jmp    f5 <strcmp+0x45>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	38 c8                	cmp    %cl,%al
  d2:	75 15                	jne    e9 <strcmp+0x39>
    p++, q++;
  d4:	89 d9                	mov    %ebx,%ecx
  d6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  dc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  e3:	84 c0                	test   %al,%al
  e5:	75 e9                	jne    d0 <strcmp+0x20>
  e7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e9:	29 c8                	sub    %ecx,%eax
}
  eb:	5b                   	pop    %ebx
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f1:	31 c0                	xor    %eax,%eax
  f3:	eb f4                	jmp    e9 <strcmp+0x39>
  f5:	0f b6 cb             	movzbl %bl,%ecx
  f8:	eb ef                	jmp    e9 <strcmp+0x39>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000100 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 12                	je     11d <strlen+0x1d>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 11d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <memset>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	53                   	push   %ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 15a:	0f b6 18             	movzbl (%eax),%ebx
 15d:	84 db                	test   %bl,%bl
 15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d1                	mov    %edx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 197:	53                   	push   %ebx
 198:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 19b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19e:	eb 31                	jmp    1d1 <gets+0x41>
    cc = read(0, &c, 1);
 1a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a7:	00 
 1a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b3:	e8 04 01 00 00       	call   2bc <read>
    if(cc < 1)
 1b8:	85 c0                	test   %eax,%eax
 1ba:	7e 1d                	jle    1d9 <gets+0x49>
      break;
    buf[i++] = c;
 1bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1c5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cb:	74 0c                	je     1d9 <gets+0x49>
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 08                	je     1d9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	7c c7                	jl     1a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e0:	83 c4 2c             	add    $0x2c,%esp
 1e3:	5b                   	pop    %ebx
 1e4:	5e                   	pop    %esi
 1e5:	5f                   	pop    %edi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
 1f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 202:	00 
 203:	89 04 24             	mov    %eax,(%esp)
 206:	e8 d9 00 00 00       	call   2e4 <open>
  if(fd < 0)
 20b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 20f:	78 27                	js     238 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 1c 24             	mov    %ebx,(%esp)
 217:	89 44 24 04          	mov    %eax,0x4(%esp)
 21b:	e8 dc 00 00 00       	call   2fc <fstat>
  close(fd);
 220:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 223:	89 c6                	mov    %eax,%esi
  close(fd);
 225:	e8 a2 00 00 00       	call   2cc <close>
  return r;
 22a:	89 f0                	mov    %esi,%eax
}
 22c:	83 c4 10             	add    $0x10,%esp
 22f:	5b                   	pop    %ebx
 230:	5e                   	pop    %esi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23d:	eb ed                	jmp    22c <stat+0x3c>
 23f:	90                   	nop

00000240 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
 246:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 17                	ja     26d <atoi+0x2d>
 256:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 258:	83 c1 01             	add    $0x1,%ecx
 25b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 25e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 262:	0f be 11             	movsbl (%ecx),%edx
 265:	8d 5a d0             	lea    -0x30(%edx),%ebx
 268:	80 fb 09             	cmp    $0x9,%bl
 26b:	76 eb                	jbe    258 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 26d:	5b                   	pop    %ebx
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 271:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	53                   	push   %ebx
 27a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 280:	85 db                	test   %ebx,%ebx
 282:	7e 12                	jle    296 <memmove+0x26>
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	90                   	nop
 29b:	90                   	nop

0000029c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29c:	b8 01 00 00 00       	mov    $0x1,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <exit>:
SYSCALL(exit)
 2a4:	b8 02 00 00 00       	mov    $0x2,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <wait>:
SYSCALL(wait)
 2ac:	b8 03 00 00 00       	mov    $0x3,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <pipe>:
SYSCALL(pipe)
 2b4:	b8 04 00 00 00       	mov    $0x4,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <read>:
SYSCALL(read)
 2bc:	b8 05 00 00 00       	mov    $0x5,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <write>:
SYSCALL(write)
 2c4:	b8 10 00 00 00       	mov    $0x10,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <close>:
SYSCALL(close)
 2cc:	b8 15 00 00 00       	mov    $0x15,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <kill>:
SYSCALL(kill)
 2d4:	b8 06 00 00 00       	mov    $0x6,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <exec>:
SYSCALL(exec)
 2dc:	b8 07 00 00 00       	mov    $0x7,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <open>:
SYSCALL(open)
 2e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <mknod>:
SYSCALL(mknod)
 2ec:	b8 11 00 00 00       	mov    $0x11,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <unlink>:
SYSCALL(unlink)
 2f4:	b8 12 00 00 00       	mov    $0x12,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <fstat>:
SYSCALL(fstat)
 2fc:	b8 08 00 00 00       	mov    $0x8,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <link>:
SYSCALL(link)
 304:	b8 13 00 00 00       	mov    $0x13,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <mkdir>:
SYSCALL(mkdir)
 30c:	b8 14 00 00 00       	mov    $0x14,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <chdir>:
SYSCALL(chdir)
 314:	b8 09 00 00 00       	mov    $0x9,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <dup>:
SYSCALL(dup)
 31c:	b8 0a 00 00 00       	mov    $0xa,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <getpid>:
SYSCALL(getpid)
 324:	b8 0b 00 00 00       	mov    $0xb,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <date>:
SYSCALL(date)
 344:	b8 16 00 00 00       	mov    $0x16,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <dup2>:
SYSCALL(dup2)
 34c:	b8 17 00 00 00       	mov    $0x17,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <alarm>:
SYSCALL(alarm)
 354:	b8 18 00 00 00       	mov    $0x18,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <printint>:
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	89 c6                	mov    %eax,%esi
 367:	53                   	push   %ebx
 368:	83 ec 4c             	sub    $0x4c,%esp
 36b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 36e:	85 db                	test   %ebx,%ebx
 370:	74 09                	je     37b <printint+0x1b>
 372:	89 d0                	mov    %edx,%eax
 374:	c1 e8 1f             	shr    $0x1f,%eax
 377:	84 c0                	test   %al,%al
 379:	75 75                	jne    3f0 <printint+0x90>
 37b:	89 d0                	mov    %edx,%eax
 37d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 384:	89 75 c0             	mov    %esi,-0x40(%ebp)
 387:	31 ff                	xor    %edi,%edi
 389:	89 ce                	mov    %ecx,%esi
 38b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 38e:	eb 02                	jmp    392 <printint+0x32>
 390:	89 cf                	mov    %ecx,%edi
 392:	31 d2                	xor    %edx,%edx
 394:	f7 f6                	div    %esi
 396:	8d 4f 01             	lea    0x1(%edi),%ecx
 399:	0f b6 92 9a 07 00 00 	movzbl 0x79a(%edx),%edx
 3a0:	85 c0                	test   %eax,%eax
 3a2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 3a5:	75 e9                	jne    390 <printint+0x30>
 3a7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3aa:	89 c8                	mov    %ecx,%eax
 3ac:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3af:	85 d2                	test   %edx,%edx
 3b1:	74 08                	je     3bb <printint+0x5b>
 3b3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3b6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 3bb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3be:	66 90                	xchg   %ax,%ax
 3c0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3c5:	83 ef 01             	sub    $0x1,%edi
 3c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cf:	00 
 3d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3d4:	89 34 24             	mov    %esi,(%esp)
 3d7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3da:	e8 e5 fe ff ff       	call   2c4 <write>
 3df:	83 ff ff             	cmp    $0xffffffff,%edi
 3e2:	75 dc                	jne    3c0 <printint+0x60>
 3e4:	83 c4 4c             	add    $0x4c,%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f0:	89 d0                	mov    %edx,%eax
 3f2:	f7 d8                	neg    %eax
 3f4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3fb:	eb 87                	jmp    384 <printint+0x24>
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <printf>:
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	31 ff                	xor    %edi,%edi
 406:	56                   	push   %esi
 407:	53                   	push   %ebx
 408:	83 ec 3c             	sub    $0x3c,%esp
 40b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 40e:	8d 45 10             	lea    0x10(%ebp),%eax
 411:	8b 75 08             	mov    0x8(%ebp),%esi
 414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 417:	0f b6 13             	movzbl (%ebx),%edx
 41a:	83 c3 01             	add    $0x1,%ebx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 39                	jne    45a <printf+0x5a>
 421:	e9 c2 00 00 00       	jmp    4e8 <printf+0xe8>
 426:	66 90                	xchg   %ax,%ax
 428:	83 fa 25             	cmp    $0x25,%edx
 42b:	0f 84 bf 00 00 00    	je     4f0 <printf+0xf0>
 431:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 434:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 43b:	00 
 43c:	89 44 24 04          	mov    %eax,0x4(%esp)
 440:	89 34 24             	mov    %esi,(%esp)
 443:	88 55 e2             	mov    %dl,-0x1e(%ebp)
 446:	e8 79 fe ff ff       	call   2c4 <write>
 44b:	83 c3 01             	add    $0x1,%ebx
 44e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 452:	84 d2                	test   %dl,%dl
 454:	0f 84 8e 00 00 00    	je     4e8 <printf+0xe8>
 45a:	85 ff                	test   %edi,%edi
 45c:	0f be c2             	movsbl %dl,%eax
 45f:	74 c7                	je     428 <printf+0x28>
 461:	83 ff 25             	cmp    $0x25,%edi
 464:	75 e5                	jne    44b <printf+0x4b>
 466:	83 fa 64             	cmp    $0x64,%edx
 469:	0f 84 31 01 00 00    	je     5a0 <printf+0x1a0>
 46f:	25 f7 00 00 00       	and    $0xf7,%eax
 474:	83 f8 70             	cmp    $0x70,%eax
 477:	0f 84 83 00 00 00    	je     500 <printf+0x100>
 47d:	83 fa 73             	cmp    $0x73,%edx
 480:	0f 84 a2 00 00 00    	je     528 <printf+0x128>
 486:	83 fa 63             	cmp    $0x63,%edx
 489:	0f 84 35 01 00 00    	je     5c4 <printf+0x1c4>
 48f:	83 fa 25             	cmp    $0x25,%edx
 492:	0f 84 e0 00 00 00    	je     578 <printf+0x178>
 498:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 49b:	83 c3 01             	add    $0x1,%ebx
 49e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a5:	00 
 4a6:	31 ff                	xor    %edi,%edi
 4a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ac:	89 34 24             	mov    %esi,(%esp)
 4af:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4b2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4b6:	e8 09 fe ff ff       	call   2c4 <write>
 4bb:	8b 55 d0             	mov    -0x30(%ebp),%edx
 4be:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c8:	00 
 4c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cd:	89 34 24             	mov    %esi,(%esp)
 4d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d3:	e8 ec fd ff ff       	call   2c4 <write>
 4d8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4dc:	84 d2                	test   %dl,%dl
 4de:	0f 85 76 ff ff ff    	jne    45a <printf+0x5a>
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e8:	83 c4 3c             	add    $0x3c,%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5f                   	pop    %edi
 4ee:	5d                   	pop    %ebp
 4ef:	c3                   	ret    
 4f0:	bf 25 00 00 00       	mov    $0x25,%edi
 4f5:	e9 51 ff ff ff       	jmp    44b <printf+0x4b>
 4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 500:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	31 ff                	xor    %edi,%edi
 50a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 511:	8b 10                	mov    (%eax),%edx
 513:	89 f0                	mov    %esi,%eax
 515:	e8 46 fe ff ff       	call   360 <printint>
 51a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 51e:	e9 28 ff ff ff       	jmp    44b <printf+0x4b>
 523:	90                   	nop
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 52b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 52f:	8b 38                	mov    (%eax),%edi
 531:	b8 93 07 00 00       	mov    $0x793,%eax
 536:	85 ff                	test   %edi,%edi
 538:	0f 44 f8             	cmove  %eax,%edi
 53b:	0f b6 07             	movzbl (%edi),%eax
 53e:	84 c0                	test   %al,%al
 540:	74 2a                	je     56c <printf+0x16c>
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 548:	88 45 e3             	mov    %al,-0x1d(%ebp)
 54b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 54e:	83 c7 01             	add    $0x1,%edi
 551:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 558:	00 
 559:	89 44 24 04          	mov    %eax,0x4(%esp)
 55d:	89 34 24             	mov    %esi,(%esp)
 560:	e8 5f fd ff ff       	call   2c4 <write>
 565:	0f b6 07             	movzbl (%edi),%eax
 568:	84 c0                	test   %al,%al
 56a:	75 dc                	jne    548 <printf+0x148>
 56c:	31 ff                	xor    %edi,%edi
 56e:	e9 d8 fe ff ff       	jmp    44b <printf+0x4b>
 573:	90                   	nop
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 578:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 57b:	31 ff                	xor    %edi,%edi
 57d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 584:	00 
 585:	89 44 24 04          	mov    %eax,0x4(%esp)
 589:	89 34 24             	mov    %esi,(%esp)
 58c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 590:	e8 2f fd ff ff       	call   2c4 <write>
 595:	e9 b1 fe ff ff       	jmp    44b <printf+0x4b>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a8:	66 31 ff             	xor    %di,%di
 5ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5b2:	8b 10                	mov    (%eax),%edx
 5b4:	89 f0                	mov    %esi,%eax
 5b6:	e8 a5 fd ff ff       	call   360 <printint>
 5bb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5bf:	e9 87 fe ff ff       	jmp    44b <printf+0x4b>
 5c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5c7:	31 ff                	xor    %edi,%edi
 5c9:	8b 00                	mov    (%eax),%eax
 5cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d2:	00 
 5d3:	89 34 24             	mov    %esi,(%esp)
 5d6:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5d9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e0:	e8 df fc ff ff       	call   2c4 <write>
 5e5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5e9:	e9 5d fe ff ff       	jmp    44b <printf+0x4b>
 5ee:	90                   	nop
 5ef:	90                   	nop

000005f0 <free>:
 5f0:	55                   	push   %ebp
 5f1:	a1 18 0a 00 00       	mov    0xa18,%eax
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5fe:	8b 08                	mov    (%eax),%ecx
 600:	8d 53 f8             	lea    -0x8(%ebx),%edx
 603:	39 d0                	cmp    %edx,%eax
 605:	72 11                	jb     618 <free+0x28>
 607:	90                   	nop
 608:	39 c8                	cmp    %ecx,%eax
 60a:	72 04                	jb     610 <free+0x20>
 60c:	39 ca                	cmp    %ecx,%edx
 60e:	72 10                	jb     620 <free+0x30>
 610:	89 c8                	mov    %ecx,%eax
 612:	39 d0                	cmp    %edx,%eax
 614:	8b 08                	mov    (%eax),%ecx
 616:	73 f0                	jae    608 <free+0x18>
 618:	39 ca                	cmp    %ecx,%edx
 61a:	72 04                	jb     620 <free+0x30>
 61c:	39 c8                	cmp    %ecx,%eax
 61e:	72 f0                	jb     610 <free+0x20>
 620:	8b 73 fc             	mov    -0x4(%ebx),%esi
 623:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 626:	39 cf                	cmp    %ecx,%edi
 628:	74 1e                	je     648 <free+0x58>
 62a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 62d:	8b 48 04             	mov    0x4(%eax),%ecx
 630:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 633:	39 f2                	cmp    %esi,%edx
 635:	74 28                	je     65f <free+0x6f>
 637:	89 10                	mov    %edx,(%eax)
 639:	a3 18 0a 00 00       	mov    %eax,0xa18
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    
 643:	90                   	nop
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 648:	03 71 04             	add    0x4(%ecx),%esi
 64b:	89 73 fc             	mov    %esi,-0x4(%ebx)
 64e:	8b 08                	mov    (%eax),%ecx
 650:	8b 09                	mov    (%ecx),%ecx
 652:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 655:	8b 48 04             	mov    0x4(%eax),%ecx
 658:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 65b:	39 f2                	cmp    %esi,%edx
 65d:	75 d8                	jne    637 <free+0x47>
 65f:	03 4b fc             	add    -0x4(%ebx),%ecx
 662:	a3 18 0a 00 00       	mov    %eax,0xa18
 667:	89 48 04             	mov    %ecx,0x4(%eax)
 66a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66d:	89 10                	mov    %edx,(%eax)
 66f:	5b                   	pop    %ebx
 670:	5e                   	pop    %esi
 671:	5f                   	pop    %edi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    
 674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 67a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000680 <malloc>:
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 1c             	sub    $0x1c,%esp
 689:	8b 45 08             	mov    0x8(%ebp),%eax
 68c:	8b 1d 18 0a 00 00    	mov    0xa18,%ebx
 692:	8d 48 07             	lea    0x7(%eax),%ecx
 695:	c1 e9 03             	shr    $0x3,%ecx
 698:	85 db                	test   %ebx,%ebx
 69a:	8d 71 01             	lea    0x1(%ecx),%esi
 69d:	0f 84 9b 00 00 00    	je     73e <malloc+0xbe>
 6a3:	8b 13                	mov    (%ebx),%edx
 6a5:	8b 7a 04             	mov    0x4(%edx),%edi
 6a8:	39 fe                	cmp    %edi,%esi
 6aa:	76 64                	jbe    710 <malloc+0x90>
 6ac:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 6b3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6bb:	eb 0e                	jmp    6cb <malloc+0x4b>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
 6c0:	8b 02                	mov    (%edx),%eax
 6c2:	8b 78 04             	mov    0x4(%eax),%edi
 6c5:	39 fe                	cmp    %edi,%esi
 6c7:	76 4f                	jbe    718 <malloc+0x98>
 6c9:	89 c2                	mov    %eax,%edx
 6cb:	3b 15 18 0a 00 00    	cmp    0xa18,%edx
 6d1:	75 ed                	jne    6c0 <malloc+0x40>
 6d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6dc:	bf 00 10 00 00       	mov    $0x1000,%edi
 6e1:	0f 43 fe             	cmovae %esi,%edi
 6e4:	0f 42 c3             	cmovb  %ebx,%eax
 6e7:	89 04 24             	mov    %eax,(%esp)
 6ea:	e8 3d fc ff ff       	call   32c <sbrk>
 6ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 6f2:	74 18                	je     70c <malloc+0x8c>
 6f4:	89 78 04             	mov    %edi,0x4(%eax)
 6f7:	83 c0 08             	add    $0x8,%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 ee fe ff ff       	call   5f0 <free>
 702:	8b 15 18 0a 00 00    	mov    0xa18,%edx
 708:	85 d2                	test   %edx,%edx
 70a:	75 b4                	jne    6c0 <malloc+0x40>
 70c:	31 c0                	xor    %eax,%eax
 70e:	eb 20                	jmp    730 <malloc+0xb0>
 710:	89 d0                	mov    %edx,%eax
 712:	89 da                	mov    %ebx,%edx
 714:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 718:	39 fe                	cmp    %edi,%esi
 71a:	74 1c                	je     738 <malloc+0xb8>
 71c:	29 f7                	sub    %esi,%edi
 71e:	89 78 04             	mov    %edi,0x4(%eax)
 721:	8d 04 f8             	lea    (%eax,%edi,8),%eax
 724:	89 70 04             	mov    %esi,0x4(%eax)
 727:	89 15 18 0a 00 00    	mov    %edx,0xa18
 72d:	83 c0 08             	add    $0x8,%eax
 730:	83 c4 1c             	add    $0x1c,%esp
 733:	5b                   	pop    %ebx
 734:	5e                   	pop    %esi
 735:	5f                   	pop    %edi
 736:	5d                   	pop    %ebp
 737:	c3                   	ret    
 738:	8b 08                	mov    (%eax),%ecx
 73a:	89 0a                	mov    %ecx,(%edx)
 73c:	eb e9                	jmp    727 <malloc+0xa7>
 73e:	c7 05 18 0a 00 00 1c 	movl   $0xa1c,0xa18
 745:	0a 00 00 
 748:	ba 1c 0a 00 00       	mov    $0xa1c,%edx
 74d:	c7 05 1c 0a 00 00 1c 	movl   $0xa1c,0xa1c
 754:	0a 00 00 
 757:	c7 05 20 0a 00 00 00 	movl   $0x0,0xa20
 75e:	00 00 00 
 761:	e9 46 ff ff ff       	jmp    6ac <malloc+0x2c>
