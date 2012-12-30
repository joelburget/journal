# Wednesday, December 19, 2012

## 10:34 AM - curl

Should show content because there is no redirect:

    curl --max-redirs 0 'http://znd-https-dot-khan-academy.appspot.com/about/our-interns'

You can set a user agent and this should show no content because there was a redirect:

    curl -AChrome/13 --max-redirs 0 'http://znd-https-dot-khan-academy.appspot.com/about/our-interns'

## 2:48 PM - Datastore nuance

When naming a property with a different name in the datastore and on the model,
the datastore name goes in index.yaml and in (db) queries. Example:

    # property definition
    origin_revision_key = object_property.KeyProperty(name="origin_revision")

    # query
    .filter('origin_scratchpad', x)

    # index.yaml
    - name: origin_scratchpad

## 3:05 PM - more curl

`-v` shows all the traffic.

## 8:38 PM - more curl and other commands

`-O` - write output to a local file named like the remote file we get.

`-L` - follow redirects

`-I` - view headers

`-H` - set a header, example "curl -H 'x-api-key:yourapikey' url"

`-i` - view headers and body

`-d` - send the specified data in a POST request

    curl https://api.faker.com/v1/customers \
        -H 'x-api-key:apikey' \
        -H 'Content-Type: application/json' \
        -d '{"firstName":"Justin", "lastName":"Bieber"}'

`-X` - custom request method - `PUT` or `DELETE`

jq
--

`jq '.'` - return the entire response

`jq `.results[0]` - access the first element in the results field

`jq '.results[0] | {from_user, text}'` - narrow that result down to two fields

`jq '.results[] | {from_user, text, media: [.entities.media[].media_url]}'` -
collect complex results into usable formats

[jq manual](http://stedolan.github.com/jq/)
