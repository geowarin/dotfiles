function pacnew --wraps=fd\ \".+\\.pac\(new\|save\)\"\ /etc\ 2\>\ /dev/null --description alias\ pacnew\ fd\ \".+\\.pac\(new\|save\)\"\ /etc\ 2\>\ /dev/null
  fd ".+\.pac(new|save)" /etc 2> /dev/null $argv
        
end
