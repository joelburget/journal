# Tuesday, September 11, 2012

## 10:42 AM - `hg addremove`

`hg addremove` adds all new files and removes all missing files.

## 10:46 AM - naming a tmux window

`tmux rename-window` or `C-b ,`

## 10:50 AM - Accent insensitive Javascript `RegExp`

In the autocomplete I wrote for KA there was a problem when a person looking
Cézanne starts typing "Cezanne" (no accent) and doesn't get the results they're
looking for. I created an accent insensitive `RegExp`. This version only
worries about the accents found on our site, but could easily be extended.

    /**
     * Creates an accent insensitive RegExp, inspired by
     * http://stackoverflow.com/a/228006
     * @param {string} searchString string to match accent-insensitively
     * @param {string} opts RegExp options, like 'i' or 'gi'
     */
    function accentInsensitiveRegExp(searchString, opts) {
        // Just replace any character that can have an accent by the class of all
        // its variations. Example:
        //     /cezanne/ -> /c[EeèéÉ]z[Aaàá]nn[EeèéÉ]/
        var accentReplacer = function(chr) {
            return accented[chr.toUpperCase()] || chr;
        }
        searchString = searchString.replace(/\S/g, accentReplacer);

        return new RegExp(searchString, opts);
    }

    /* These are the unicode characters we want to match, indexed by the uppercase
     * version of the ascii character we want to match them. A couple other unicode
     * characters occur in our titles - '\u2013' (en-dash) and '\u2019' (right
     * single quotation mark). We just ignore them since they're not word
     * characters.
     */
    var accented = {
        "A": "[Aa\xe0\xe1]",
        "E": "[Ee\xe8\xe9\xc9]",
        "I": "[Ii\xed]",
        "O": "[Oo\xf2-\xf6]",
        "U": "[Uu\xf9\xfc]"
    };
