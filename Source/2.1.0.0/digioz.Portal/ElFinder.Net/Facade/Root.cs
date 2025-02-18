﻿using System;
using System.Drawing;
using System.IO;
using System.Collections.Generic;

namespace ElFinder
{
    /// <summary>
    /// Represents a root of file system
    /// </summary>
    public class Root
    {
        #region public

            /// <summary>
            /// Initialize new instanse of class <see cref="ElFinder.Root"/>
            /// </summary>
            /// <param name="directory">Directory which will be root</param>
            /// <param name="url">Url to root</param>
            public Root(DirectoryInfo directory, string url)
            {
                if (directory == null)
                    throw new ArgumentNullException("directory", "Root directory can not be null");
                if (!directory.Exists)
                    throw new ArgumentException("Root directory must exist", "directory");
                _alias = directory.Name;
                _directory = directory;
                _url = url;
                _uploadOverwrite = true;
                _thumbnailsSize = 48;  
            }

            /// <summary>
            /// Initialize new instanse of class <see cref="ElFinder.Root"/>
            /// </summary>
            /// <param name="directory">Directory which will be root</param>
            public Root(DirectoryInfo directory) : this(directory, null) { }

            /// <summary>
            /// Gets a autogenerated prefix of root
            /// </summary>
            public string VolumeId
            {
                get { return _volumeId; }
                internal set { _volumeId = value; }
            }

            /// <summary>
            /// Get or sets alias for root. If not set will use directory name of path
            /// </summary>
            public string Alias
            {
                get { return _alias; }
                set { _alias = value; }
            }

            /// <summary>
            /// Get or sets a directory which is root 
            /// </summary>
            public DirectoryInfo Directory
            {
                get { return _directory; }
                set
                {
                    if (value == null)
                        throw new ArgumentNullException("Root directory can not be null", "value");
                    if (!value.Exists)
                        throw new ArgumentException("Directory must exist", "directory");
                    _directory = value;
                }
            }

            /// <summary>
            /// Get or sets url that points to path directory (also called 'root URL'). 
            /// </summary>
            public string Url
            {
                get
                {
                    return _url;
                }
                set
                {
                    if (value == null)
                        throw new ArgumentNullException("Url can not be null", "value");
                    _url = value;
                }
            }

            /// <summary>
            /// Get or sets if root for read only (users can't change file)
            /// </summary>
            public bool IsReadOnly { get; set; }

            /// <summary>
            /// Get or sets if user can only show files (and cannot download).
            /// Note: if you set url property, than users can access to directory by the provided url
            /// </summary>
            public bool IsShowOnly { get; set; }

            /// <summary>
            /// Get or sets if root is locked (user can't remove, rename or delete files or subdirectories)  
            /// </summary>
            public bool IsLocked { get; set; }

            /// <summary>
            /// Get or sets a subfolder of root diretory, which will be start 
            /// </summary>
            public DirectoryInfo StartPath
            {
                get { return _startPath; }
                set
                {
                    if (value != null && !value.Exists)
                        _startPath = null;//throw new ArgumentException("Start directory must exist or can be null", "value");
                    else
                        _startPath = value;
                }
            }       

            /// <summary>
            /// Get or sets maximum upload file size. This size is per files in bytes. 
            /// Note: you still to configure maxupload limits in web.config for whole application
            /// </summary>
            public int? MaxUploadSize
            {
                get { return _maxUploadSize; }
                set
                {
                    if (value.HasValue && value.Value < 0)
                        throw new ArgumentException("Max upload size can not be less than zero", "value");
                    _maxUploadSize = value; }
            }

            /// <summary>
            /// Get or sets maximum upload file size. This size is per files in kb. 
            /// Note: you still to configure maxupload limits in web.config for whole application
            /// </summary>
            public double? MaxUploadSizeInKb
            {
                get { return _maxUploadSize.HasValue ? (double?)(_maxUploadSize.Value / 1024.0) : null; }
                set
                {
                    MaxUploadSize = value.HasValue ? (int?)(value * 1024) : null;
                }
            }

            /// <summary>
            /// Get or sets maximum upload file size. This size is per files in Mb. 
            /// Note: you still to configure maxupload limits in web.config for whole application
            /// </summary>
            public double? MaxUploadSizeInMb
            {
                get { return MaxUploadSizeInKb.HasValue ? (double?)(MaxUploadSizeInKb.Value / 1024.0) : null; }
                set
                {
                    MaxUploadSizeInKb = value.HasValue ? (int?)(value * 1024) : null;
                }
            }

            /// <summary>
            /// Get or sets if files on upload will replace or give them new names. true - replace old files, false give new names like original_name-number.ext
            /// </summary>
            public bool UploadOverwrite
            {
                get { return _uploadOverwrite; }
                set { _uploadOverwrite = value; }
            }

            /// <summary>
            /// Get or sets thumbnails size
            /// </summary>
            public int ThumbnailsSize
            {
                get { return _thumbnailsSize; }
                set
                {
                    if (value <= 0)
                        throw new ArgumentException("Size can not be less or equals zero");
                    _thumbnailsSize = value;
                }
            }

            /// <summary>
            /// Get ot sets thumbnals url
            /// </summary>
            public string ThumbnailsUrl
            {
                get { return _thumbnailsUrl; }
                set
                {
                    if (string.IsNullOrEmpty(value))
                        throw new ArgumentNullException("Url can not be null or empty");
                    _thumbnailsUrl = value;
                }
            }

            /// <summary>
            /// Get or sets directory for store all thumbnails.
            /// </summary>
            public DirectoryInfo ThumbnailsStorage
            {
                get { return _thumbnailsStorage; }
                set
                {
                    if (value != null)
                    {
                        if (!value.Exists)
                            throw new ArgumentException("Thumbnails storage directory must exist");
                        _thumbnailsDirectory = new DirectoryInfo(Path.Combine(value.FullName, ".tmb_" + _directory.Name));
                        if (!_thumbnailsDirectory.Exists)
                        {
                            _thumbnailsDirectory = System.IO.Directory.CreateDirectory(_thumbnailsDirectory.FullName);
                            _thumbnailsDirectory.Attributes |= FileAttributes.Hidden;
                        }
                    }
                    else
                    {
                        _thumbnailsDirectory = value;
                    }
                    _thumbnailsStorage = value;
                }
            }

            /// <summary>
            /// Get or sets pictures editor. The object responsible for generating thumnails and .
            /// </summary>
            public IPicturesEditor PicturesEditor
            {
                get
                {
                    if (_picturesEditor == null)
                        _picturesEditor = new DefaultPicturesEditor();
                    return _picturesEditor;
                }
                set
                {
                    if (value == null)
                        throw new ArgumentNullException("value");
                    _picturesEditor = value;
                }
            }
            public IEnumerable<string> ArchiveMimeTypes
            {
                get 
                {
                    if (_arhciveMimeTypes == null)
                        _arhciveMimeTypes = new List<string>();
                    return _arhciveMimeTypes;
                }
                set
                {
                    _arhciveMimeTypes = value;
                }
            }
            public IEnumerable<string> ExtractMimeTypes
            {
                get
                {
                    if (_extractMimeTypes == null)
                        _extractMimeTypes = new List<string>();
                    return _extractMimeTypes;
                }
                set
                {
                    _extractMimeTypes = value;
                }
            }

        #endregion


        #region private
            internal Size GetImageDimension(FileInfo input)
            {
                if (!input.Exists)
                    throw new ArgumentException("File not exist");
                using (Image image = Image.FromFile(input.FullName))
                {
                    return new Size(image.Width, image.Height);
                }
            }

            internal bool CanCreateThumbnail(FileInfo input)
            {
                return ThumbnailsUrl != null && PicturesEditor.CanProcessFile(input.Extension);
            }
            
            internal string GetExistingThumbPath(FileInfo originalImage)
            {
                string thumbPath = GenerateThumbPath(originalImage);
                return thumbPath != null && File.Exists(thumbPath) ? thumbPath : null;
            }

            internal string GetExistingThumbPath(DirectoryInfo originalDirectory)
            {
                if (_thumbnailsDirectory == null)
                    return null;
                string relativePath = originalDirectory.FullName.Substring(_directory.FullName.Length);
                string thumbDir = _thumbnailsDirectory.FullName + relativePath;
                return System.IO.Directory.Exists(thumbDir) ? thumbDir : null;
            }

            internal string GetExistingThumbHash(FileInfo originalImage)
            {
                string thumbPath = GetExistingThumbPath(originalImage);
                if (thumbPath == null)
                    return null;
                string relativePath = thumbPath.Substring(_thumbnailsDirectory.FullName.Length);
                return VolumeId + Helper.EncodePath(relativePath);
            }

            internal string GenerateThumbHash(FileInfo originalImage)
            {                
                if (_thumbnailsDirectory == null)
                {
                    string thumbName = Path.GetFileNameWithoutExtension(originalImage.Name) + "_" + Helper.GetFileMd5(originalImage) + originalImage.Extension;
                    string relativePath = originalImage.DirectoryName.Substring(_directory.FullName.Length);
                    return VolumeId + Helper.EncodePath(relativePath + "\\" + thumbName);
                }
                else
                {
                    string thumbPath = GenerateThumbPath(originalImage);
                    string relativePath = thumbPath.Substring(_thumbnailsDirectory.FullName.Length);
                    return VolumeId + Helper.EncodePath(relativePath);
                }
            }

            internal ImageWithMime GenerateThumbnail(FullPath originalImage)
            {
                string name = originalImage.File.Name;
                for (int i = name.Length - 1; i >= 0; i--)
                {
                    if (name[i] == '_')
                    {
                        name = name.Substring(0, i);
                        break;
                    }
                }
                string fullPath = originalImage.File.DirectoryName + "\\" + name + originalImage.File.Extension;
                
                if (_thumbnailsDirectory != null)
                {
                    FileInfo thumbPath;
                    if (originalImage.File.FullName.StartsWith(_thumbnailsDirectory.FullName))
                        thumbPath = originalImage.File;
                    else
                        thumbPath = new FileInfo(Path.Combine(_thumbnailsDirectory.FullName, originalImage.RelativePath));
                    if (!thumbPath.Exists)
                    {
                        if (!thumbPath.Directory.Exists)
                            System.IO.Directory.CreateDirectory(thumbPath.Directory.FullName);
                        using (FileStream thumbFile = thumbPath.Create())
                        {
                            using (FileStream original = File.OpenRead(fullPath))
                            {
                                ImageWithMime thumb = PicturesEditor.GenerateThumbnail(original, _thumbnailsSize, true);
                                thumb.ImageStream.CopyTo(thumbFile);
                                thumb.ImageStream.Position = 0;
                                return thumb;
                            }
                        }
                    }
                    else
                    {
                        return new ImageWithMime(PicturesEditor.ConvertThumbnailExtension(thumbPath.Extension), thumbPath.OpenRead());
                    }
                }
                else
                {
                    using (FileStream original = File.OpenRead(fullPath))
                    {
                        return PicturesEditor.GenerateThumbnail(original, _thumbnailsSize, true);   
                    }                    
                }
            }

            private string GenerateThumbPath(FileInfo originalImage)
            {
                if (_thumbnailsDirectory == null || !CanCreateThumbnail(originalImage))
                    return null;
                string relativePath = originalImage.FullName.Substring(_directory.FullName.Length);
                string thumbDir = Path.GetDirectoryName(_thumbnailsDirectory.FullName + relativePath);
                string thumbName = Path.GetFileNameWithoutExtension(originalImage.Name) + "_" + Helper.GetFileMd5(originalImage) + originalImage.Extension;
                return Path.Combine(thumbDir, thumbName);
            }

            private string _volumeId;
            private string _alias;
            private DirectoryInfo _directory;
            private DirectoryInfo _startPath;
            private int? _maxUploadSize;
            private bool _uploadOverwrite;
            private string _url;

            private string _thumbnailsUrl;
            private int _thumbnailsSize;
            private DirectoryInfo _thumbnailsDirectory;
            private DirectoryInfo _thumbnailsStorage;
            private IPicturesEditor _picturesEditor;
            private IEnumerable<string> _arhciveMimeTypes;
            private IEnumerable<string> _extractMimeTypes;

        #endregion
    }
}