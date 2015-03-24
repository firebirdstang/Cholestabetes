using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cholestabetes.EncryptionApp
{
    public class ListEncryptor
    {
        static readonly char[] DELIMITER = "\r\n".ToCharArray();

        public static List<EncryptionPair> Encrypt(string lst)
        {
            List<EncryptionPair> retLst = new List<EncryptionPair>(); 

            foreach (var item in lst.Split(DELIMITER))
            {
                if (!string.IsNullOrEmpty(item))
                {
                    EncryptionPair pair = new EncryptionPair() { originalStr = item, newStr = Cholestabetes.Encryption.Encryptor.Encrypt(item) };
                    retLst.Add(pair);
                }
            }

            return retLst;
        }

        public static List<EncryptionPair> Decrypt(string lst)
        {
            List<EncryptionPair> retLst = new List<EncryptionPair>();

            foreach (var item in lst.Split(DELIMITER))
            {
                if (!string.IsNullOrEmpty(item))
                {
                    EncryptionPair pair = new EncryptionPair() { originalStr = item, newStr = Cholestabetes.Encryption.Encryptor.Decrypt(item) };
                    retLst.Add(pair);
                }
            }

            return retLst;
        }

    }
}
