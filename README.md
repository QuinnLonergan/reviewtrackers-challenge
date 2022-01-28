# ReviewTrackers - Backend Code Challenge

## Introduction

This web service accepts requests of a lender URL from lendingtree.com (i.e. https://www.lendingtree.com/reviews/mortgage/loansnap/39777117) and uses a web scraper to collect all the reviews for the given lender and returns a json object for each review.

If the same url is submitted twice, only new reviews will be created but ALL reviews for that url will still be returned.

## Technologies

This project uses the following technologies:
- Rails 6.1
- Ruby 2.7
- Nokogiri
- Open Uri
- Rspec

## Setup

To get set up, run:

```console
$ bundle install
$ rails db:migrate
```

You can run the Rails server with:

```console
$ rails s
```

And you can run the tests in spec/requests/reviews_spec.rb with:

```console
$ rspec spec/requests/reviews_spec.rb
```

The tests are checking the following functionality:
- Returns a list of reviews with correct parameters from a valid lendingtree url.
- Does not allow duplicate reviews to be posted.
- Uses pagination to return every review for a given lender.
- Returns an error for an invalid url.
- Returns an error for an invalid lendingtree url.

To manually test the API with your own URL, make a post request to http://localhost:3000/collect_reviews with an API testing application such as Postman:

```console
{
    "url": "YOUR URL HERE"
}
```


