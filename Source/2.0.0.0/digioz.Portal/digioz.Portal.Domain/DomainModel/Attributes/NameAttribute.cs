﻿using System;

namespace digioz.Portal.Domain.DomainModel.Attributes
{
    [AttributeUsage(AttributeTargets.Class)]
    public class NameAttribute : Attribute
    {
        public string Name { get; set; }

        public NameAttribute(string name)
        {
            Name = name;
        }
    }
}
