﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Xml;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Application
{
    public class RssResult : ActionResult
    {

        private readonly List<RssItem> _items;
        private readonly string _title;
        private readonly string _description;

        /// <summary>
        /// Initialises the RssResult
        /// </summary>
        /// <param name="items">The items to be added to the rss feed.</param>
        /// <param name="title">The title of the rss feed.</param>
        /// <param name="description">A short description about the rss feed.</param>
        public RssResult(IEnumerable<RssItem> items, string title, string description)
        {
            _items = new List<RssItem>(items);
            _title = title;
            _description = description;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            var settings = new XmlWriterSettings {Indent = true, NewLineHandling = NewLineHandling.Entitize};

            context.HttpContext.Response.ContentType = "text/xml";
            using (var _writer = XmlWriter.Create(context.HttpContext.Response.OutputStream, settings))
            {

                // Begin structure
                _writer.WriteStartElement("rss");
                _writer.WriteAttributeString("version", "2.0");
                _writer.WriteStartElement("channel");

                _writer.WriteElementString("title", _title);
                _writer.WriteElementString("description", _description);
                _writer.WriteElementString("link", context.HttpContext.Request.Url.GetLeftPart(UriPartial.Authority));

                // Individual items
                _items.ForEach(x =>
                {
                    _writer.WriteStartElement("item");
                    _writer.WriteElementString("title", x.Title);
                    _writer.WriteElementString("description", x.Description);
                    _writer.WriteElementString("pubDate", x.PublishedDate.ToString("o"));
                    _writer.WriteElementString("link", context.HttpContext.Request.Url.GetLeftPart(UriPartial.Authority) + x.Link);
                    if(!string.IsNullOrEmpty(x.RssImage))
                    {
                        _writer.WriteStartElement("image");
                        _writer.WriteElementString("url", string.Concat(context.HttpContext.Request.Url.GetLeftPart(UriPartial.Authority), x.RssImage));
                        _writer.WriteElementString("title", x.Title);
                        _writer.WriteElementString("link", context.HttpContext.Request.Url.GetLeftPart(UriPartial.Authority) + x.Link);
                        _writer.WriteEndElement();
                    }
                    _writer.WriteEndElement();
                });

                // End structure
                _writer.WriteEndElement();
                _writer.WriteEndElement();
            }
        }

    }
}