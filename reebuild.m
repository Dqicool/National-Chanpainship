function Img = reebuild(proj)

    outSize = 2 * floor(size(proj,1) / 2 / sqrt(2));
    outCenter = floor((outSize + 1) / 2);

    outxLeft = -outCenter + 1;
    outx = repmat(outxLeft : outSize - 1 + outxLeft, outSize, 1);

    outyTop = outCenter - 1;
    outy = (outyTop : -1 : 1 - outSize +outyTop)';
    outy = repmat(outy,1,outSize);

    projSize = size(proj,1);
    projCenter = ceil(projSize/2);
    Img = 0;

    for ii = 1:180
        projii = proj(:,ii);
        rotLim = (1:projSize) - projCenter;
        rotAxis = outx .* cos((ii-1) ./ 180 .* pi) + outy .* sin((ii-1) ./ 180 .* pi);
        projCon = interp1(rotLim,projii,rotAxis(:));
        Img = Img + reshape(projCon,outSize,outSize);
        %imshow(img,[])
    end
end