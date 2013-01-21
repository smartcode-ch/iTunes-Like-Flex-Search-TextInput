# iTunes like Flex search TextInput

A sample application with a custom Flex component based on the `spark.components.TextInput` to filter data in a `mx.collections.ArrayCollection`. The functional and graphical design is modeled closely to the search field found in [iTunes](http://www.apple.com/itunes/).

## Motivation

- A slick component to filter data shown in a `DataGrid`.

- Get some more experience with skinning in Flex 4.

## Requirements

- [Flex SDK 4.x](http://opensource.adobe.com/wiki/display/flexsdk/Downloads)

## Usage (API)

The class `ch.smartcode.iTunesLikeSearchTextInput.inputs.iTunesLikeSearchTextInput` is the actual component. 

Set the `dataProvider` property to the `mx.collections.ArrayCollection` to filter. 

The `searchOptionsData` property takes an `mx.collections.ArrayCollection` of `ch.smartcode.iTunesLikeSearchTextInput.vo.SearchOptionVO` instances. Each of these value objects represent a field to filter for in the `dataProvider`. If the `field` value of the `SearchOptionVO` is set to `null`, all data is filtered.

## More

- [Visit the blog post](http://www.smartcode.ch/blog/itunes-like-flex-search-text-input/).
- Check out the [demo](http://showcase.smartcode.ch/itunes-like-flex-search-text-input/).
