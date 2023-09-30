function saltImage = SaltPaper(imagedata,d)
    saltImage = imnoise(imagedata,'salt & pepper',d);
end

