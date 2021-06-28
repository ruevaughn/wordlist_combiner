HTTP Basic Auth brute force wordlist generator. Combines two wordlists into one

Usage
 ./combiner --file1 '/path/to/wordlist/users.txt' --file2 '/path/to/wordlist/passwords.txt'

Takes two wordlists and combines them together for HTTP Basic Auth Enumeration

| users.txt |
-------------
| admin |
| root  |
| info  |
| user  |

| passwords.txt |
-----------------
| 1245 |
| 123456 |
| pass123 |

and generates into a format thats easily enumerated when using Hydra THC, Burp Intruder, or like toos for enumerating and cracking HTTP BASIC Auth

| combined.txt |
----------------
| admin:1235 |
| admin:123456 |
|admin:pass123 |
|root:1235|
|root:123456|
|root:pass123|
|info:1245 |
|info:123456|
|info:pass123|
|user:1245|
|user:123456|
|user:pass123|

