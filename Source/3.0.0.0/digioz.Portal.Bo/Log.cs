﻿using System;
using System.Collections.Generic;

#nullable disable

namespace digioz.Portal.Bo
{
    public partial class Log
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public DateTime? Timestamp { get; set; }
    }
}
