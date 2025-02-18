using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.BLL
{
    public class CommentLogic : BaseLogic
    {
        /// <summary>
        /// Method to fetch Comment Configuration
        /// Based on the id passed in
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static CommentConfig GetCommentConfig(string id)
        {
            var commentConfig = Db.CommentConfigs.SingleOrDefault(x => x.Id == id);

            return commentConfig;
        }

        /// <summary>
        /// Method to fetch All Comment Configurations 
        /// </summary>
        /// <returns></returns>
        public static List<CommentConfig> GetCommentConfigs()
        {
            var commentConfigs = Db.CommentConfigs.ToList();

            return commentConfigs;
        }

        /// <summary>
        /// Method for adding a new Comment Configuration
        /// </summary>
        /// <param name="commentConfig"></param>
        public static void CommentConfigAdd(CommentConfig commentConfig)
        {
            Db.CommentConfigs.Add(commentConfig);
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to edit Comment Config Record
        /// </summary>
        /// <param name="commentConfig"></param>
        public static void CommentConfigEdit(CommentConfig commentConfig)
        {
            Db.Entry(commentConfig).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to delete Comment Config Record
        /// </summary>
        /// <param name="id"></param>
        public static void Delete(string id)
        {
            var commentConfig = Db.CommentConfigs.Find(id);
            Db.CommentConfigs.Remove(commentConfig);
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to get a single Comment Post
        /// Based on the Id passed in
        /// </summary>
        /// <param name="id"></param>
        public static Comment GetCommentPost(string id)
        {
            var comment = Db.Comments.SingleOrDefault(x => x.Id == id);

            return comment;
        }

        /// <summary>
        /// Method to get all Comment Posts 
        /// </summary>
        /// <returns></returns>
        public static List<Comment> GetCommentPosts()
        {
            var comments = Db.Comments.ToList();

            return comments;
        }

        public static List<Comment> GetCommentPostsByReference(int referenceId, string referenceType)
        {
            var comments = Db.Comments.Where(x => x.ReferenceId == referenceId.ToString() && x.ReferenceType == referenceType).ToList();

            return comments;
        }

        /// <summary>
        /// Method to add a new Comment Post
        /// </summary>
        /// <param name="comment"></param>
        public static void AddCommentPost(Comment comment)
        {
            Db.Comments.Add(comment);
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to add a Comment Post Like
        /// </summary>
        /// <param name="id"></param>
        public static void AddCommentPostLike(string id)
        {
            var comment = Db.Comments.Find(id);
            comment.Likes++;
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to Edit an existing Comment Post
        /// </summary>
        /// <param name="comment"></param>
        public static void EditCommentPost(Comment comment)
        {
            Db.Entry(comment).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Method to Delete an existing Comment Post
        /// </summary>
        /// <param name="id"></param>
        public static void DeleteCommentPost(string id)
        {
            var comment = Db.Comments.Find(id);
            Db.Comments.Remove(comment);
            Db.SaveChanges();
        }
    }
}
