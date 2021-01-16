Nginx regex location syntax

Regex expressions can be used with Nginx location block section, this is implemented with the PCRE engine.

Nginx location:

Nginx location block section have a search order, a modifier, an implicit match type and an implicit switch
to whether stop the search on match or not. the following array describe it for regex.

```sh
# --------------------------------------------------------------------------------------------------------------------------------------------
# Search-Order       Modifier       Description                                                        Match-Type        Stops-search-on-match
# --------------------------------------------------------------------------------------------------------------------------------------------
#     1st               =           The URI must match the specified pattern exactly                  Simple-string              Yes
#     2nd               ^~          The URI must begin with the specified pattern                     Simple-string              Yes
#     3rd             (None)        The URI must begin with the specified pattern                     Simple-string               No
#     4th               ~           The URI must be a case-sensitive match to the specified Rx      Perl-Compatible-Rx      Yes (first match)                 
#     4th               ~*          The URI must be a case-insensitive match to the specified Rx    Perl-Compatible-Rx      Yes (first match)
#     N/A               @           Defines a named location block.                                   Simple-string              Yes
# --------------------------------------------------------------------------------------------------------------------------------------------
```

Capturing group:

Capturing group, expression evaluation () are supported, this example location ~ ^/(?:index|update)$
match url ending with example.com/index and example.com/update

```sh
# -----------------------------------------------------------------------------------------
#    ()    : Group/Capturing-group, capturing mean match and retain/output/use what matched
#            the patern inside (). the default bracket mode is "capturing group" while (?:) 
#            is a non capturing group. example (?:a|b) match a or b in a non capturing mode
# ----------------------------------------------------------------------------------------- 
#    ?:    : Non capturing group
#    ?=    : Positive look ahead 
#    ?!    : is for negative look ahead (do not match the following...)
#    ?<=   : is for positive look behind
#    ?<!   : is for negative look behind
# -----------------------------------------------------------------------------------------
```

The forward slash:

Not to confuse with the regex slash \, In nginx the forward slash / is used to match any sub location including
none example location /. In the context of regex support the following explanation apply

```sh
# -----------------------------------------------------------------------------------------
#     /    : It doesn't actually do anything. In Javascript, Perl and some other languages, 
#            it is used as a delimiter character explicitly for regular expressions.
#            Some languages like PHP use it as a delimiter inside a string, 
#            with additional options passed at the end, just like Javascript and Perl.
#            Nginx does not use delimiter, / can be escaped with \/ for code portability 
#            purpose BUT this is not required for nginx / are handled literally 
#            (don't have other meaning than /)
# -----------------------------------------------------------------------------------------
```

The slash:

The first purpose of the regex special character \ is meant to escape the next character;
But note that in most case \ followed by a character have a different meaning, a complete list is available here.

Nginx does not require escaping the forward slash / it does not either deny escaping it like we could escape any
other character. and thus \/ is translated/matching /. One purpose of escaping forward slashes in the context of
nginx could be for code portability.

Other regex chars

Here is a non exhaustive list of regex expression that can be used

```sh
# -----------------------------------------------------------------------------------------
#     ~     : Enable regex mode for location (in regex ~ mean case-sensitive match)
#     ~*    : case-insensitive match
#     |     : Or
#     ()    : Match group or evaluate the content of ()
#     $     : the expression must be at the end of the evaluated text 
#             (no char/text after the match) $ is usually used at the end of a regex 
#             location expression. 
#     ?     : Check for zero or one occurrence of the previous char ex jpe?g
#     ^~    : The match must be at the beginning of the text, note that nginx will not perform 
#             any further regular expression match even if an other match is available 
#             (check the table above); ^ indicate that the match must be at the start of 
#             the uri text, while ~ indicates a regular expression match mode.
#             example (location ^~ /realestate/.*)
#             Nginx evaluation exactly this as don't check regexp locations if this 
#             location is longest prefix match.
#     =     : Exact match, no sub folders (location = /)
#     ^     : Match the beginning of the text (opposite of $). By itself, ^ is a 
#             shortcut for all paths (since they all have a beginning).
#     .*    : Match zero, one or more occurrence of any char
#     \     : Escape the next char
#     .     : Any char 
#     *     : Match zero, one or more occurrence of the previous char
#     !     : Not (negative look ahead)
#     {}    : Match a specific number of occurrence ex. [0-9]{3} match 342 but not 32
#             {2,4} match length of 2, 3 and 4
#     +     : Match one or more occurrence of the previous char 
#     []    : Match any char inside
# --------------------------------------------------------------------------------------------
```

Examples:

location ~ ^/(?:index)\.php(?:$|/)

location ~ ^\/(?:core\/img\/background.png|core\/img\/favicon.ico)(?:$|\/)

location ~ ^/(?:index|core/ajax/update|ocs/v[12]|status|updater/.+|oc[ms]-provider/.+)\.php(?:$|/)

    More one regex char, the "any not inside", [^xyz] = all that is not xyz – Peter Krauss Sep 20 '20 at 14:53

## Use negative regex assertion:

```sh
location ~ ^/(?!(favicon\.ico|resources|robots\.txt)) { 
.... # your stuff 
} 
```

Source Negated Regular Expressions in location

Explanation of Regex :

If URL does not match any of the following path

example.com/favicon.ico
example.com/resources
example.com/robots.txt

Then it will go inside that location block and will process it.
