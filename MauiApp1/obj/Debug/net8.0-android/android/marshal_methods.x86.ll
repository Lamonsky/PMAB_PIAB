; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [438 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [870 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 28453725, ; 3: Microsoft.ServiceHub.Resources => 0x1b22b5d => 194
	i32 31127110, ; 4: de/Microsoft.VisualStudio.Validation.resources.dll => 0x1daf646 => 408
	i32 32687329, ; 5: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 278
	i32 34715100, ; 6: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 312
	i32 34839235, ; 7: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39092988, ; 8: it/StreamJsonRpc.resources.dll => 0x25482fc => 424
	i32 39109920, ; 9: Newtonsoft.Json.dll => 0x254c520 => 218
	i32 39485524, ; 10: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 145
	i32 59429692, ; 12: zh-Hans\Microsoft.VisualStudio.Utilities.resources => 0x38ad33c => 405
	i32 65960268, ; 13: Microsoft.Win32.SystemEvents.dll => 0x3ee794c => 216
	i32 66541672, ; 14: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 15: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 353
	i32 68219467, ; 16: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 68642905, ; 17: Microsoft.ServiceHub.Framework => 0x4176859 => 193
	i32 72070932, ; 18: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 19: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 20: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 296
	i32 108733175, ; 21: cs\StreamJsonRpc.resources => 0x67b22f7 => 420
	i32 115380460, ; 22: pt-BR/Microsoft.ServiceHub.Resources.dll => 0x6e090ec => 203
	i32 117431740, ; 23: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120362947, ; 24: es\Microsoft.VisualStudio.Validation.resources => 0x72c97c3 => 409
	i32 120558881, ; 25: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 296
	i32 122350210, ; 26: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 27: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 316
	i32 142721839, ; 28: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 29: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 153123973, ; 30: zh-Hant/Microsoft.VisualStudio.Threading.resources.dll => 0x9207c85 => 392
	i32 157393651, ; 31: it\StreamJsonRpc.resources => 0x961a2f3 => 424
	i32 159306688, ; 32: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 33: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 252
	i32 169830674, ; 34: cs/Microsoft.VisualStudio.Utilities.resources.dll => 0xa1f6912 => 393
	i32 176265551, ; 35: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 36: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 298
	i32 184328833, ; 37: System.ValueTuple.dll => 0xafca281 => 151
	i32 188465623, ; 38: it\Microsoft.VisualStudio.Utilities.resources => 0xb3bc1d7 => 398
	i32 195333248, ; 39: ru/Microsoft.ServiceHub.Framework.resources.dll => 0xba48c80 => 363
	i32 195452805, ; 40: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 350
	i32 199333315, ; 41: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 351
	i32 205061960, ; 42: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 43: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 250
	i32 213667278, ; 44: System.Threading.AccessControl.dll => 0xcbc4dce => 235
	i32 220171995, ; 45: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 46: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 272
	i32 230752869, ; 47: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 48: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 49: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 50: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 51: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 255
	i32 273259262, ; 52: pl/Microsoft.VisualStudio.Threading.resources.dll => 0x10499afe => 387
	i32 276479776, ; 53: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 54: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 274
	i32 280482487, ; 55: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 271
	i32 280992041, ; 56: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 322
	i32 291076382, ; 57: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 292742791, ; 58: zh-Hant\Microsoft.VisualStudio.Composition.resources => 0x1172e687 => 379
	i32 298918909, ; 59: System.Net.Ping.dll => 0x11d123fd => 69
	i32 304642387, ; 60: de/StreamJsonRpc.resources.dll => 0x12287953 => 421
	i32 304871158, ; 61: cs/Microsoft.ServiceHub.Framework.resources.dll => 0x122bf6f6 => 354
	i32 317674968, ; 62: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 350
	i32 318968648, ; 63: Xamarin.AndroidX.Activity.dll => 0x13031348 => 241
	i32 321597661, ; 64: System.Numerics => 0x132b30dd => 83
	i32 323872715, ; 65: tr\Microsoft.VisualStudio.Threading.resources => 0x134de7cb => 390
	i32 336156722, ; 66: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 335
	i32 342366114, ; 67: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 273
	i32 356389973, ; 68: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 334
	i32 360082299, ; 69: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 70: System.IO.Pipes => 0x15ebe147 => 55
	i32 373955117, ; 71: pt-BR/Microsoft.VisualStudio.Composition.resources.dll => 0x164a1a2d => 375
	i32 374914964, ; 72: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 73: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 74: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 75: System.Memory.dll => 0x16fe439a => 62
	i32 386288746, ; 76: System.Composition.Convention.dll => 0x17064c6a => 223
	i32 392610295, ; 77: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 78: _Microsoft.Android.Resource.Designer => 0x17969339 => 434
	i32 403441872, ; 79: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 80: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 346
	i32 435911658, ; 81: it/Microsoft.ServiceHub.Framework.resources.dll => 0x19fb7bea => 358
	i32 441335492, ; 82: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 256
	i32 442565967, ; 83: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 84: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 269
	i32 451504562, ; 85: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 86: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 456436778, ; 87: ja\Microsoft.VisualStudio.Utilities.resources => 0x1b34ac2a => 399
	i32 459347974, ; 88: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 89: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 90: System.dll => 0x1bff388e => 164
	i32 476646585, ; 91: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 271
	i32 486930444, ; 92: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 284
	i32 498788369, ; 93: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 94: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 333
	i32 503918385, ; 95: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 327
	i32 513247710, ; 96: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 524368971, ; 97: Microsoft.VisualStudio.RemoteControl => 0x1f413c4b => 209
	i32 526420162, ; 98: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 99: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 316
	i32 530272170, ; 100: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 531215550, ; 101: tr/Microsoft.ServiceHub.Resources.dll => 0x1fa9b4be => 205
	i32 539058512, ; 102: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 539350393, ; 103: es/Microsoft.VisualStudio.Composition.resources.dll => 0x2025d579 => 369
	i32 540030774, ; 104: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 105: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 106: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 107: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 176
	i32 549171840, ; 108: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 551244813, ; 109: Microsoft.VisualStudio.RemoteControl.dll => 0x20db540d => 209
	i32 557405415, ; 110: Jsr305Binding => 0x213954e7 => 309
	i32 565739715, ; 111: pl\Microsoft.ServiceHub.Framework.resources => 0x21b880c3 => 361
	i32 569601784, ; 112: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 307
	i32 576772757, ; 113: ko/Microsoft.VisualStudio.Utilities.resources.dll => 0x2260da95 => 400
	i32 577249123, ; 114: ru/Microsoft.ServiceHub.Resources.dll => 0x22681f63 => 204
	i32 577335427, ; 115: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 116: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 341
	i32 593280183, ; 117: pl\Microsoft.VisualStudio.Threading.resources => 0x235cbcb7 => 387
	i32 601371474, ; 118: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 119: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 610295161, ; 120: Nerdbank.Streams => 0x24605d79 => 217
	i32 613668793, ; 121: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 122: Xamarin.AndroidX.CustomView => 0x2568904f => 261
	i32 627931235, ; 123: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 339
	i32 639843206, ; 124: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 267
	i32 643868501, ; 125: System.Net => 0x2660a755 => 81
	i32 662205335, ; 126: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 127: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 303
	i32 666292255, ; 128: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 248
	i32 672442732, ; 129: System.Collections.Concurrent => 0x2814a96c => 8
	i32 674091085, ; 130: zh-Hant/Microsoft.VisualStudio.Utilities.resources.dll => 0x282dd04d => 406
	i32 683518922, ; 131: System.Net.Security => 0x28bdabca => 73
	i32 687422377, ; 132: System.Composition.Convention => 0x28f93ba9 => 223
	i32 688181140, ; 133: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 321
	i32 690569205, ; 134: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 135: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 318
	i32 693804605, ; 136: System.Windows => 0x295a9e3d => 154
	i32 695788247, ; 137: ru\StreamJsonRpc.resources => 0x2978e2d7 => 429
	i32 699345723, ; 138: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 139: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 313
	i32 700358131, ; 140: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 141: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 336
	i32 709557578, ; 142: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 324
	i32 711994786, ; 143: MessagePack.Annotations.dll => 0x2a702da2 => 175
	i32 712122614, ; 144: pl/Microsoft.VisualStudio.Composition.resources.dll => 0x2a7220f6 => 374
	i32 713568204, ; 145: MauiApp1.dll => 0x2a882fcc => 0
	i32 713619040, ; 146: pl\Microsoft.VisualStudio.Composition.resources => 0x2a88f660 => 374
	i32 720511267, ; 147: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 317
	i32 722857257, ; 148: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 149: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 150: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 151: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 238
	i32 759454413, ; 152: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 153: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 772964186, ; 154: Microsoft.NET.StringTools => 0x2e127f5a => 192
	i32 775423778, ; 155: Microsoft.VisualStudio.Utilities => 0x2e380722 => 213
	i32 775507847, ; 156: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 157: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 345
	i32 783888833, ; 158: System.Composition.Runtime.dll => 0x2eb931c1 => 225
	i32 789151979, ; 159: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 160: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 262
	i32 804715423, ; 161: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 162: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 276
	i32 809851609, ; 163: System.Drawing.Common.dll => 0x30455ad9 => 230
	i32 823281589, ; 164: System.Private.Uri.dll => 0x311247b5 => 86
	i32 828617472, ; 165: MessagePack => 0x3163b300 => 174
	i32 830298997, ; 166: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 167: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 168: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 169: Xamarin.AndroidX.Print => 0x3246f6cd => 289
	i32 853556215, ; 170: zh-Hant/StreamJsonRpc.resources.dll => 0x32e03bf7 => 432
	i32 856887035, ; 171: zh-Hant\StreamJsonRpc.resources => 0x33130efb => 432
	i32 873119928, ; 172: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 873184914, ; 173: it\Microsoft.ServiceHub.Framework.resources => 0x340bbe92 => 358
	i32 874617570, ; 174: it/Microsoft.VisualStudio.Validation.resources.dll => 0x34219ae2 => 411
	i32 877678880, ; 175: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 176: System.Net.Http.Json => 0x3463c971 => 63
	i32 899639606, ; 177: de/Microsoft.ServiceHub.Framework.resources.dll => 0x359f6936 => 355
	i32 904024072, ; 178: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 179: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 180: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 348
	i32 928116545, ; 181: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 312
	i32 943095258, ; 182: Microsoft.VisualStudio.Threading.dll => 0x38367dda => 212
	i32 951893052, ; 183: es/StreamJsonRpc.resources.dll => 0x38bcbc3c => 422
	i32 952186615, ; 184: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 185: Newtonsoft.Json => 0x38f24a24 => 218
	i32 956575887, ; 186: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 317
	i32 966729478, ; 187: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 310
	i32 967690846, ; 188: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 273
	i32 975236339, ; 189: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 190: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 191: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 192: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 193: System.Collections.dll => 0x3b2c715c => 12
	i32 993615995, ; 194: tr\StreamJsonRpc.resources => 0x3b39607b => 430
	i32 994442037, ; 195: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 196: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 197: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 293
	i32 1019214401, ; 198: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 199: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 200: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 323
	i32 1031528504, ; 201: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 311
	i32 1035644815, ; 202: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 246
	i32 1036536393, ; 203: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1040991296, ; 204: pt-BR\Microsoft.ServiceHub.Resources => 0x3e0c4440 => 203
	i32 1044663988, ; 205: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1051753857, ; 206: it\Microsoft.ServiceHub.Resources => 0x3eb07d81 => 199
	i32 1052210849, ; 207: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 280
	i32 1053420091, ; 208: ko/Microsoft.ServiceHub.Framework.resources.dll => 0x3ec9ea3b => 360
	i32 1067306892, ; 209: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 210: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 211: Xamarin.Kotlin.StdLib => 0x409e66d8 => 314
	i32 1089913930, ; 212: System.Diagnostics.EventLog.dll => 0x40f6c44a => 228
	i32 1090075282, ; 213: ko\Microsoft.VisualStudio.Validation.resources => 0x40f93a92 => 413
	i32 1094566626, ; 214: tr/Microsoft.VisualStudio.Threading.resources.dll => 0x413dc2e2 => 390
	i32 1098259244, ; 215: System => 0x41761b2c => 164
	i32 1101083655, ; 216: zh-Hans/Microsoft.VisualStudio.Threading.resources.dll => 0x41a13407 => 391
	i32 1103730406, ; 217: de\Microsoft.VisualStudio.Validation.resources => 0x41c996e6 => 408
	i32 1112895853, ; 218: ja\Microsoft.VisualStudio.Composition.resources => 0x4255716d => 372
	i32 1118262833, ; 219: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 336
	i32 1121599056, ; 220: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 279
	i32 1127624469, ; 221: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1139481312, ; 222: tr\Microsoft.VisualStudio.Validation.resources => 0x43eb1ae0 => 417
	i32 1144428656, ; 223: ru\Microsoft.ServiceHub.Resources => 0x44369870 => 204
	i32 1145483052, ; 224: System.Windows.Extensions.dll => 0x4446af2c => 236
	i32 1149092582, ; 225: Xamarin.AndroidX.Window => 0x447dc2e6 => 306
	i32 1160460173, ; 226: ja\Microsoft.ServiceHub.Resources => 0x452b378d => 200
	i32 1160506222, ; 227: cs\Microsoft.VisualStudio.Validation.resources => 0x452beb6e => 407
	i32 1168523401, ; 228: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 342
	i32 1170634674, ; 229: System.Web.dll => 0x45c677b2 => 153
	i32 1172727707, ; 230: tr/Microsoft.VisualStudio.Utilities.resources.dll => 0x45e6679b => 404
	i32 1175144683, ; 231: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 302
	i32 1177596986, ; 232: es\Microsoft.VisualStudio.Threading.resources => 0x4630b43a => 382
	i32 1178241025, ; 233: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 287
	i32 1200878152, ; 234: zh-Hans\Microsoft.VisualStudio.Composition.resources => 0x4793f248 => 378
	i32 1203215381, ; 235: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 340
	i32 1204270330, ; 236: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 248
	i32 1208641965, ; 237: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1215995024, ; 238: cs/Microsoft.VisualStudio.Validation.resources.dll => 0x487a9c90 => 407
	i32 1219128291, ; 239: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1221558168, ; 240: fr\Microsoft.ServiceHub.Resources => 0x48cf7f98 => 198
	i32 1234928153, ; 241: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 338
	i32 1243150071, ; 242: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 307
	i32 1250940849, ; 243: ru/StreamJsonRpc.resources.dll => 0x4a8fd7b1 => 429
	i32 1253011324, ; 244: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 245: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 322
	i32 1264511973, ; 246: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 297
	i32 1267360935, ; 247: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 301
	i32 1273260888, ; 248: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 253
	i32 1275534314, ; 249: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 318
	i32 1278448581, ; 250: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 245
	i32 1283884340, ; 251: ru\Microsoft.VisualStudio.Utilities.resources => 0x4c868534 => 403
	i32 1291938557, ; 252: zh-Hans/Microsoft.ServiceHub.Framework.resources.dll => 0x4d016afd => 365
	i32 1293217323, ; 253: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 264
	i32 1309188875, ; 254: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1312305870, ; 255: es/Microsoft.VisualStudio.Threading.resources.dll => 0x4e3832ce => 382
	i32 1317684655, ; 256: pt-BR\Microsoft.VisualStudio.Utilities.resources => 0x4e8a45af => 402
	i32 1322716291, ; 257: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 306
	i32 1324164729, ; 258: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 259: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1342308820, ; 260: pt-BR/StreamJsonRpc.resources.dll => 0x500201d4 => 428
	i32 1344524710, ; 261: ko/Microsoft.ServiceHub.Resources.dll => 0x5023d1a6 => 201
	i32 1351692320, ; 262: System.Diagnostics.PerformanceCounter.dll => 0x50913020 => 229
	i32 1355083757, ; 263: ja/Microsoft.VisualStudio.Utilities.resources.dll => 0x50c4efed => 399
	i32 1360515965, ; 264: it/Microsoft.ServiceHub.Resources.dll => 0x5117d37d => 199
	i32 1362232280, ; 265: fr/Microsoft.VisualStudio.Composition.resources.dll => 0x513203d8 => 370
	i32 1364015309, ; 266: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 267: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 352
	i32 1376866003, ; 268: Xamarin.AndroidX.SavedState => 0x52114ed3 => 293
	i32 1379779777, ; 269: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1385717816, ; 270: Microsoft.NET.StringTools.dll => 0x52986038 => 192
	i32 1402170036, ; 271: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 272: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 257
	i32 1408764838, ; 273: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 274: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 275: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 276: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 320
	i32 1434145427, ; 277: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 278: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 310
	i32 1439761251, ; 279: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 280: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 281: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 282: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 283: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1458690844, ; 284: de/Microsoft.VisualStudio.Composition.resources.dll => 0x56f1db1c => 368
	i32 1461004990, ; 285: es\Microsoft.Maui.Controls.resources => 0x57152abe => 326
	i32 1461234159, ; 286: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 287: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 288: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 289: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 247
	i32 1470490898, ; 290: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 291: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 292: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1485998545, ; 293: es/Microsoft.ServiceHub.Framework.resources.dll => 0x589289d1 => 356
	i32 1487239319, ; 294: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 295: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 294
	i32 1491711090, ; 296: ko\Microsoft.VisualStudio.Utilities.resources => 0x58e9b472 => 400
	i32 1493001747, ; 297: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 330
	i32 1514721132, ; 298: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 325
	i32 1536373174, ; 299: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 300: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 301: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 302: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 303: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 345
	i32 1565862583, ; 304: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 305: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1569712871, ; 306: cs/Microsoft.VisualStudio.Composition.resources.dll => 0x5d8feae7 => 367
	i32 1571401718, ; 307: fr\Microsoft.VisualStudio.Utilities.resources => 0x5da9aff6 => 397
	i32 1573704789, ; 308: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1578373161, ; 309: tr/Microsoft.VisualStudio.Validation.resources.dll => 0x5e141029 => 417
	i32 1579920047, ; 310: Microsoft.VisualStudio.Composition => 0x5e2baaaf => 208
	i32 1580037396, ; 311: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 312: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 263
	i32 1583195853, ; 313: tr/StreamJsonRpc.resources.dll => 0x5e5da6cd => 430
	i32 1592978981, ; 314: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 315: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 311
	i32 1601112923, ; 316: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 317: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1617512207, ; 318: fr/Microsoft.ServiceHub.Framework.resources.dll => 0x6069470f => 357
	i32 1618516317, ; 319: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 320: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 283
	i32 1622358360, ; 321: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1622869249, ; 322: it\Microsoft.VisualStudio.Threading.resources => 0x60bb0501 => 384
	i32 1624863272, ; 323: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 305
	i32 1635184631, ; 324: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 267
	i32 1636296978, ; 325: pt-BR\StreamJsonRpc.resources => 0x6187e912 => 428
	i32 1636350590, ; 326: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 260
	i32 1639515021, ; 327: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 328: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 329: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 330: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 331: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 299
	i32 1658251792, ; 332: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 308
	i32 1658304144, ; 333: ko\Microsoft.ServiceHub.Framework.resources => 0x62d7b690 => 360
	i32 1670060433, ; 334: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 255
	i32 1675553242, ; 335: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 336: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 337: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679202908, ; 338: zh-Hans/Microsoft.ServiceHub.Resources.dll => 0x64169a5c => 206
	i32 1679769178, ; 339: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1686249020, ; 340: ja\Microsoft.VisualStudio.Threading.resources => 0x64821e3c => 385
	i32 1691477237, ; 341: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 342: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 343: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 315
	i32 1701541528, ; 344: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1703925064, ; 345: es/Microsoft.ServiceHub.Resources.dll => 0x658fd548 => 197
	i32 1712031326, ; 346: System.Composition.Hosting.dll => 0x660b865e => 224
	i32 1716144236, ; 347: ja/Microsoft.VisualStudio.Threading.resources.dll => 0x664a486c => 385
	i32 1720223769, ; 348: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 276
	i32 1726116996, ; 349: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 350: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 351: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 251
	i32 1730207299, ; 352: es\Microsoft.VisualStudio.Composition.resources => 0x6720de43 => 369
	i32 1736233607, ; 353: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 343
	i32 1743415430, ; 354: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 321
	i32 1744735666, ; 355: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 356: System.IO.Pipelines.dll => 0x68139a0d => 231
	i32 1746316138, ; 357: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 358: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1753421227, ; 359: fr/StreamJsonRpc.resources.dll => 0x688315ab => 423
	i32 1755348698, ; 360: Microsoft.VisualStudio.Telemetry.dll => 0x68a07eda => 211
	i32 1758240030, ; 361: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 362: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 363: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 364: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 298
	i32 1770582343, ; 365: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 366: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 367: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 368: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 369: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 337
	i32 1788241197, ; 370: Xamarin.AndroidX.Fragment => 0x6a96652d => 269
	i32 1793428332, ; 371: de/Microsoft.VisualStudio.Utilities.resources.dll => 0x6ae58b6c => 394
	i32 1793755602, ; 372: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 329
	i32 1796167890, ; 373: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 176
	i32 1800955856, ; 374: ja/Microsoft.VisualStudio.Validation.resources.dll => 0x6b5867d0 => 412
	i32 1808383994, ; 375: ru\Microsoft.ServiceHub.Framework.resources => 0x6bc9bffa => 363
	i32 1808609942, ; 376: Xamarin.AndroidX.Loader => 0x6bcd3296 => 283
	i32 1812749057, ; 377: Microsoft.ServiceHub.Resources.dll => 0x6c0c5b01 => 194
	i32 1813058853, ; 378: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 314
	i32 1813201214, ; 379: Xamarin.Google.Android.Material => 0x6c13413e => 308
	i32 1818569960, ; 380: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 288
	i32 1818787751, ; 381: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819008552, ; 382: Microsoft.VisualStudio.Validation => 0x6c6bde28 => 215
	i32 1821864019, ; 383: ja\Microsoft.ServiceHub.Framework.resources => 0x6c977053 => 359
	i32 1824175904, ; 384: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 385: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 386: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1829150748, ; 387: System.Windows.Extensions => 0x6d06a01c => 236
	i32 1842015223, ; 388: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 349
	i32 1847515442, ; 389: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 238
	i32 1849964776, ; 390: zh-Hant/Microsoft.VisualStudio.Composition.resources.dll => 0x6e4438e8 => 379
	i32 1853025655, ; 391: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 346
	i32 1858542181, ; 392: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1860599994, ; 393: ko\Microsoft.ServiceHub.Resources => 0x6ee680ba => 201
	i32 1868228169, ; 394: zh-Hans/StreamJsonRpc.resources.dll => 0x6f5ae649 => 431
	i32 1870277092, ; 395: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1872022336, ; 396: fr\Microsoft.VisualStudio.Threading.resources => 0x6f94cb40 => 383
	i32 1874831144, ; 397: fr/Microsoft.VisualStudio.Utilities.resources.dll => 0x6fbfa728 => 397
	i32 1875089039, ; 398: fr/Microsoft.VisualStudio.Validation.resources.dll => 0x6fc3968f => 410
	i32 1875935024, ; 399: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 328
	i32 1879696579, ; 400: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1883079902, ; 401: MessagePack.dll => 0x703d84de => 174
	i32 1885316902, ; 402: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 249
	i32 1888955245, ; 403: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 404: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1892063920, ; 405: System.Diagnostics.PerformanceCounter => 0x70c69ab0 => 229
	i32 1896498791, ; 406: es\StreamJsonRpc.resources => 0x710a4667 => 422
	i32 1898237753, ; 407: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 408: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 409: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1922335654, ; 410: pt-BR/Microsoft.ServiceHub.Framework.resources.dll => 0x729483a6 => 362
	i32 1927897671, ; 411: System.CodeDom.dll => 0x72e96247 => 220
	i32 1931959220, ; 412: System.Composition.AttributedModel.dll => 0x73275bb4 => 222
	i32 1939592360, ; 413: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 414: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 415: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 295
	i32 1968388702, ; 416: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 417: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 315
	i32 1983665899, ; 418: System.Composition.TypedParts.dll => 0x763c56eb => 226
	i32 1985761444, ; 419: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 240
	i32 2003115576, ; 420: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 325
	i32 2005448994, ; 421: de/Microsoft.VisualStudio.Threading.resources.dll => 0x7788b922 => 381
	i32 2011961780, ; 422: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 423: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 280
	i32 2025202353, ; 424: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 320
	i32 2031763787, ; 425: Xamarin.Android.Glide => 0x791a414b => 237
	i32 2032514555, ; 426: pl/Microsoft.VisualStudio.Utilities.resources.dll => 0x7925b5fb => 401
	i32 2037622605, ; 427: zh-Hant/Microsoft.VisualStudio.Validation.resources.dll => 0x7973a74d => 419
	i32 2045470958, ; 428: System.Private.Xml => 0x79eb68ee => 88
	i32 2050296608, ; 429: ru/Microsoft.VisualStudio.Composition.resources.dll => 0x7a350b20 => 376
	i32 2055257422, ; 430: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 275
	i32 2060060697, ; 431: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 432: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 324
	i32 2070888862, ; 433: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 434: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2087266082, ; 435: cs/Microsoft.ServiceHub.Resources.dll => 0x7c692722 => 195
	i32 2090596640, ; 436: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2124090883, ; 437: it\Microsoft.VisualStudio.Composition.resources => 0x7e9b0e03 => 371
	i32 2127167465, ; 438: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 439: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 440: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 441: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2151741801, ; 442: ja/Microsoft.ServiceHub.Framework.resources.dll => 0x8040f969 => 359
	i32 2155551884, ; 443: ja/StreamJsonRpc.resources.dll => 0x807b1c8c => 425
	i32 2159891885, ; 444: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 445: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 332
	i32 2178612968, ; 446: System.CodeDom => 0x81dafee8 => 220
	i32 2181898931, ; 447: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2184748488, ; 448: Microsoft.VisualStudio.Utilities.Internal => 0x82389dc8 => 214
	i32 2192057212, ; 449: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 450: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 451: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 319
	i32 2201231467, ; 452: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 453: it\Microsoft.Maui.Controls.resources => 0x839595db => 334
	i32 2210888023, ; 454: ja\StreamJsonRpc.resources => 0x83c77957 => 425
	i32 2217644978, ; 455: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 302
	i32 2222056684, ; 456: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 457: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 284
	i32 2251752529, ; 458: ko/Microsoft.VisualStudio.Validation.resources.dll => 0x86370451 => 413
	i32 2252106437, ; 459: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 460: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 461: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 462: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 463: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 239
	i32 2270573516, ; 464: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 328
	i32 2279755925, ; 465: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 291
	i32 2293034957, ; 466: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 467: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 468: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 469: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 338
	i32 2305521784, ; 470: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2309813621, ; 471: zh-Hans\Microsoft.VisualStudio.Validation.resources => 0x89acf575 => 418
	i32 2314660792, ; 472: es/Microsoft.VisualStudio.Validation.resources.dll => 0x89f6ebb8 => 409
	i32 2315684594, ; 473: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 243
	i32 2320631194, ; 474: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 475: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2341020837, ; 476: fr/Microsoft.VisualStudio.Threading.resources.dll => 0x8b8924a5 => 383
	i32 2344264397, ; 477: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2352499594, ; 478: cs\Microsoft.ServiceHub.Resources => 0x8c384b8a => 195
	i32 2353062107, ; 479: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 480: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 481: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2376588888, ; 482: Microsoft.VisualStudio.Utilities.Internal.dll => 0x8da7de58 => 214
	i32 2378619854, ; 483: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2380813784, ; 484: Microsoft.VisualStudio.Threading => 0x8de855d8 => 212
	i32 2383496789, ; 485: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2386263156, ; 486: tr\Microsoft.ServiceHub.Framework.resources => 0x8e3b7c74 => 364
	i32 2395872292, ; 487: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 333
	i32 2401565422, ; 488: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2402078297, ; 489: ja/Microsoft.ServiceHub.Resources.dll => 0x8f2cce59 => 200
	i32 2403452196, ; 490: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 266
	i32 2421380589, ; 491: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 492: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 253
	i32 2423804511, ; 493: zh-Hant\Microsoft.VisualStudio.Utilities.resources => 0x9078525f => 406
	i32 2427813419, ; 494: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 330
	i32 2435356389, ; 495: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 496: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2440199119, ; 497: pl/Microsoft.VisualStudio.Validation.resources.dll => 0x91727bcf => 414
	i32 2454642406, ; 498: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 499: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 500: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 501: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 256
	i32 2471841756, ; 502: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 503: Java.Interop.dll => 0x93918882 => 168
	i32 2477680459, ; 504: fr/Microsoft.ServiceHub.Resources.dll => 0x93ae674b => 198
	i32 2480646305, ; 505: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2481512027, ; 506: cs\Microsoft.VisualStudio.Composition.resources => 0x93e8de5b => 367
	i32 2483903535, ; 507: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 508: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 509: System.AppContext.dll => 0x94798bc5 => 6
	i32 2497743743, ; 510: Data.dll => 0x94e08b7f => 433
	i32 2501346920, ; 511: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 512: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 278
	i32 2509217888, ; 513: System.Diagnostics.EventLog => 0x958fa060 => 228
	i32 2522472828, ; 514: Xamarin.Android.Glide.dll => 0x9659e17c => 237
	i32 2538310050, ; 515: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 516: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 331
	i32 2556747918, ; 517: es\Microsoft.ServiceHub.Resources => 0x9864e08e => 197
	i32 2562349572, ; 518: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 519: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 520: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 279
	i32 2581819634, ; 521: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 301
	i32 2585220780, ; 522: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 523: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 524: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 525: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 340
	i32 2605712449, ; 526: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 319
	i32 2612024650, ; 527: pt-BR/Microsoft.VisualStudio.Utilities.resources.dll => 0x9bb0554a => 402
	i32 2614377255, ; 528: pl\Microsoft.ServiceHub.Resources => 0x9bd43b27 => 202
	i32 2615233544, ; 529: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 270
	i32 2616218305, ; 530: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 531: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 532: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 533: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 260
	i32 2624644809, ; 534: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 265
	i32 2626831493, ; 535: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 335
	i32 2627185994, ; 536: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 537: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2630453997, ; 538: ru\Microsoft.VisualStudio.Threading.resources => 0x9cc98aed => 389
	i32 2633051222, ; 539: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 274
	i32 2660759594, ; 540: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 233
	i32 2663391936, ; 541: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 239
	i32 2663698177, ; 542: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 543: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 544: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 545: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2682990172, ; 546: pl\Microsoft.VisualStudio.Utilities.resources => 0x9feb2e5c => 401
	i32 2686887180, ; 547: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 548: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 549: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 299
	i32 2702473047, ; 550: zh-Hans/Microsoft.VisualStudio.Composition.resources.dll => 0xa1147757 => 378
	i32 2715334215, ; 551: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 552: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 553: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 554: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 555: Xamarin.AndroidX.Activity => 0xa2e0939b => 241
	i32 2735172069, ; 556: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 557: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 247
	i32 2740948882, ; 558: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2745835758, ; 559: pt-BR\Microsoft.VisualStudio.Threading.resources => 0xa3aa20ee => 388
	i32 2748088231, ; 560: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 561: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 341
	i32 2758225723, ; 562: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 563: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 564: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 565: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 313
	i32 2772239527, ; 566: cs\Microsoft.VisualStudio.Utilities.resources => 0xa53d04a7 => 393
	i32 2778768386, ; 567: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 304
	i32 2779977773, ; 568: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 292
	i32 2785988530, ; 569: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 347
	i32 2788224221, ; 570: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 270
	i32 2789936000, ; 571: Microsoft.VisualStudio.Telemetry => 0xa64b0b80 => 211
	i32 2795666278, ; 572: Microsoft.Win32.SystemEvents => 0xa6a27b66 => 216
	i32 2801046127, ; 573: Microsoft.VisualStudio.RpcContracts => 0xa6f4926f => 210
	i32 2801831435, ; 574: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 575: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 576: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 326
	i32 2810250172, ; 577: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 257
	i32 2819470561, ; 578: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 579: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 580: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 292
	i32 2824502124, ; 581: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 582: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 339
	i32 2838993487, ; 583: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 281
	i32 2841355853, ; 584: System.Security.Permissions => 0xa95ba64d => 234
	i32 2849599387, ; 585: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 586: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 304
	i32 2855708567, ; 587: Xamarin.AndroidX.Transition => 0xaa36a797 => 300
	i32 2861098320, ; 588: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 589: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2862626926, ; 590: ko\Microsoft.VisualStudio.Threading.resources => 0xaaa0386e => 386
	i32 2867946736, ; 591: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 233
	i32 2870099610, ; 592: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 242
	i32 2875164099, ; 593: Jsr305Binding.dll => 0xab5f85c3 => 309
	i32 2875220617, ; 594: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 595: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 268
	i32 2887636118, ; 596: System.Net.dll => 0xac1dd496 => 81
	i32 2898407901, ; 597: System.Management => 0xacc231dd => 232
	i32 2899753641, ; 598: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 599: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 600: System.Reflection => 0xacf080de => 97
	i32 2901448654, ; 601: System.Threading.AccessControl => 0xacf097ce => 235
	i32 2903344695, ; 602: System.ComponentModel.Composition => 0xad0d8637 => 221
	i32 2903867568, ; 603: zh-Hant\Microsoft.ServiceHub.Framework.resources => 0xad1580b0 => 366
	i32 2905242038, ; 604: mscorlib.dll => 0xad2a79b6 => 166
	i32 2906319247, ; 605: pt-BR\Microsoft.ServiceHub.Framework.resources => 0xad3ae98f => 362
	i32 2906574405, ; 606: cs\Microsoft.ServiceHub.Framework.resources => 0xad3ece45 => 354
	i32 2909740682, ; 607: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 608: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 305
	i32 2917422915, ; 609: zh-Hant/Microsoft.ServiceHub.Framework.resources.dll => 0xade45743 => 366
	i32 2919462931, ; 610: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 611: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 244
	i32 2936416060, ; 612: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 613: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 614: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 615: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 227
	i32 2956320711, ; 616: de\Microsoft.ServiceHub.Framework.resources => 0xb035dfc7 => 355
	i32 2959614098, ; 617: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 618: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 619: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 620: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 264
	i32 2986785889, ; 621: Data => 0xb206bc61 => 433
	i32 2987532451, ; 622: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 295
	i32 2996846495, ; 623: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 277
	i32 2999913531, ; 624: de\StreamJsonRpc.resources => 0xb2cf0c3b => 421
	i32 3012788804, ; 625: System.Configuration.ConfigurationManager => 0xb3938244 => 227
	i32 3016983068, ; 626: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 297
	i32 3017953105, ; 627: MauiApp1 => 0xb3e24f51 => 0
	i32 3023353419, ; 628: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 629: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 272
	i32 3038032645, ; 630: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 434
	i32 3056245963, ; 631: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 294
	i32 3057625584, ; 632: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 285
	i32 3059408633, ; 633: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 634: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3060576304, ; 635: en\Microsoft.VisualStudio.Utilities.resources => 0xb66cb030 => 395
	i32 3068993637, ; 636: pl/StreamJsonRpc.resources.dll => 0xb6ed2065 => 427
	i32 3075834255, ; 637: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 638: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 332
	i32 3079545995, ; 639: Microsoft.VisualStudio.Utilities.dll => 0xb78e248b => 213
	i32 3090735792, ; 640: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 641: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 642: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 643: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 644: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 645: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3125994853, ; 646: es\Microsoft.VisualStudio.Utilities.resources => 0xba52e565 => 396
	i32 3131482382, ; 647: it\Microsoft.VisualStudio.Validation.resources => 0xbaa6a10e => 411
	i32 3132293585, ; 648: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3143332311, ; 649: de/Microsoft.ServiceHub.Resources.dll => 0xbb5b71d7 => 196
	i32 3147165239, ; 650: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 651: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 652: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 653: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3168749268, ; 654: pt-BR\Microsoft.VisualStudio.Validation.resources => 0xbcdf46d4 => 415
	i32 3173478350, ; 655: fr\Microsoft.VisualStudio.Composition.resources => 0xbd276fce => 370
	i32 3178803400, ; 656: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 286
	i32 3182206061, ; 657: de\Microsoft.VisualStudio.Utilities.resources => 0xbdac9c6d => 394
	i32 3183383574, ; 658: fr\StreamJsonRpc.resources => 0xbdbe9416 => 423
	i32 3186425510, ; 659: pt-BR/Microsoft.VisualStudio.Validation.resources.dll => 0xbdecfea6 => 415
	i32 3192346100, ; 660: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 661: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 662: System.Data.dll => 0xbefef58f => 24
	i32 3205092101, ; 663: cs\Microsoft.VisualStudio.Threading.resources => 0xbf09d305 => 380
	i32 3206218667, ; 664: fr\Microsoft.VisualStudio.Validation.resources => 0xbf1b03ab => 410
	i32 3209718065, ; 665: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 666: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 263
	i32 3213246214, ; 667: System.Security.Permissions.dll => 0xbf863f06 => 234
	i32 3220365878, ; 668: System.Threading => 0xbff2e236 => 148
	i32 3222350070, ; 669: MessagePack.Annotations => 0xc01128f6 => 175
	i32 3226221578, ; 670: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3246422272, ; 671: Nerdbank.Streams.dll => 0xc1807900 => 217
	i32 3251039220, ; 672: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 673: Xamarin.AndroidX.CardView => 0xc235e84d => 251
	i32 3265493905, ; 674: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 675: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 676: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 677: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 678: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 679: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 680: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 681: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 682: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 327
	i32 3306166700, ; 683: pt-BR\Microsoft.VisualStudio.Composition.resources => 0xc51019ac => 375
	i32 3315699264, ; 684: System.Composition.Hosting => 0xc5a18e40 => 224
	i32 3316684772, ; 685: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 686: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 261
	i32 3317144872, ; 687: System.Data => 0xc5b79d28 => 24
	i32 3322415921, ; 688: cs/StreamJsonRpc.resources.dll => 0xc6080b31 => 420
	i32 3325547952, ; 689: Microsoft.VisualStudio.Composition.dll => 0xc637d5b0 => 208
	i32 3340431453, ; 690: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 249
	i32 3345895724, ; 691: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 290
	i32 3346324047, ; 692: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 287
	i32 3351212354, ; 693: zh-Hans/Microsoft.VisualStudio.Validation.resources.dll => 0xc7bf7142 => 418
	i32 3357674450, ; 694: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 344
	i32 3358260929, ; 695: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 696: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 242
	i32 3362522851, ; 697: Xamarin.AndroidX.Core => 0xc86c06e3 => 258
	i32 3366347497, ; 698: Java.Interop => 0xc8a662e9 => 168
	i32 3373098081, ; 699: tr/Microsoft.VisualStudio.Composition.resources.dll => 0xc90d6461 => 377
	i32 3374999561, ; 700: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 291
	i32 3381016424, ; 701: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 323
	i32 3388609052, ; 702: ru/Microsoft.VisualStudio.Threading.resources.dll => 0xc9fa121c => 389
	i32 3395150330, ; 703: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 704: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 705: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 262
	i32 3412783194, ; 706: zh-Hant\Microsoft.VisualStudio.Threading.resources => 0xcb6af05a => 392
	i32 3414316511, ; 707: zh-Hant\Microsoft.VisualStudio.Validation.resources => 0xcb8255df => 419
	i32 3428513518, ; 708: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 709: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 710: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 711: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 265
	i32 3445260447, ; 712: System.Formats.Tar => 0xcd5a809f => 39
	i32 3447955149, ; 713: es\Microsoft.ServiceHub.Framework.resources => 0xcd839ecd => 356
	i32 3452344032, ; 714: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3458628612, ; 715: ko\StreamJsonRpc.resources => 0xce267c04 => 426
	i32 3463511458, ; 716: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 331
	i32 3466002048, ; 717: zh-Hans\StreamJsonRpc.resources => 0xce96fe80 => 431
	i32 3471940407, ; 718: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 719: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 720: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 344
	i32 3484440000, ; 721: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 343
	i32 3485117614, ; 722: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 723: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 724: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 254
	i32 3509114376, ; 725: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 726: System.Security.dll => 0xd1854eb4 => 130
	i32 3517893222, ; 727: Microsoft.VisualStudio.RpcContracts.dll => 0xd1aeca66 => 210
	i32 3530912306, ; 728: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 729: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545363771, ; 730: System.Composition.AttributedModel => 0xd351f53b => 222
	i32 3560100363, ; 731: System.Threading.Timer => 0xd432d20b => 147
	i32 3561555760, ; 732: fr\Microsoft.ServiceHub.Framework.resources => 0xd4490730 => 357
	i32 3567349600, ; 733: System.ComponentModel.Composition.dll => 0xd4a16f60 => 221
	i32 3570554715, ; 734: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 735: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 351
	i32 3591103340, ; 736: de\Microsoft.ServiceHub.Resources => 0xd60be36c => 196
	i32 3597029428, ; 737: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 240
	i32 3598340787, ; 738: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 739: System.Linq.dll => 0xd715a361 => 61
	i32 3612435020, ; 740: System.Management.dll => 0xd751624c => 232
	i32 3616219139, ; 741: cs/Microsoft.VisualStudio.Threading.resources.dll => 0xd78b2003 => 380
	i32 3624195450, ; 742: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 743: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 289
	i32 3633644679, ; 744: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 244
	i32 3638274909, ; 745: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 746: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 275
	i32 3643446276, ; 747: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 348
	i32 3643854240, ; 748: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 286
	i32 3645089577, ; 749: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3650514644, ; 750: de\Microsoft.VisualStudio.Composition.resources => 0xd9966ed4 => 368
	i32 3657292374, ; 751: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 752: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3667615342, ; 753: it/Microsoft.VisualStudio.Composition.resources.dll => 0xda9b5e6e => 371
	i32 3672681054, ; 754: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 755: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 250
	i32 3683863696, ; 756: ru/Microsoft.VisualStudio.Utilities.resources.dll => 0xdb934c90 => 403
	i32 3684561358, ; 757: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 254
	i32 3685991093, ; 758: ko/Microsoft.VisualStudio.Threading.resources.dll => 0xdbb3c2b5 => 386
	i32 3689300923, ; 759: ru\Microsoft.VisualStudio.Composition.resources => 0xdbe643bb => 376
	i32 3689375977, ; 760: System.Drawing.Common => 0xdbe768e9 => 230
	i32 3697841164, ; 761: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 353
	i32 3700866549, ; 762: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 763: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 259
	i32 3716563718, ; 764: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718161456, ; 765: zh-Hans\Microsoft.VisualStudio.Threading.resources => 0xdd9ea430 => 391
	i32 3718780102, ; 766: Xamarin.AndroidX.Annotation => 0xdda814c6 => 243
	i32 3720915798, ; 767: tr\Microsoft.VisualStudio.Composition.resources => 0xddc8ab56 => 377
	i32 3724971120, ; 768: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 285
	i32 3732100267, ; 769: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 770: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 771: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 772: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3757354629, ; 773: pt-BR/Microsoft.VisualStudio.Threading.resources.dll => 0xdff4ae85 => 388
	i32 3786282454, ; 774: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 252
	i32 3792276235, ; 775: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 776: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 777: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3814064478, ; 778: tr\Microsoft.ServiceHub.Resources => 0xe356015e => 205
	i32 3818896425, ; 779: zh-Hans/Microsoft.VisualStudio.Utilities.resources.dll => 0xe39fbc29 => 405
	i32 3819236630, ; 780: zh-Hans\Microsoft.ServiceHub.Framework.resources => 0xe3a4ed16 => 365
	i32 3819260425, ; 781: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 782: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 783: System.Numerics.dll => 0xe4436460 => 83
	i32 3837382201, ; 784: pl\StreamJsonRpc.resources => 0xe4b9ce39 => 427
	i32 3841636137, ; 785: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 786: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 787: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3856601729, ; 788: it/Microsoft.VisualStudio.Threading.resources.dll => 0xe5df1281 => 384
	i32 3870376305, ; 789: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3871054620, ; 790: System.Composition.Runtime => 0xe6bb9b1c => 225
	i32 3873536506, ; 791: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 792: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3881281414, ; 793: StreamJsonRpc.dll => 0xe757a786 => 219
	i32 3881374827, ; 794: ko\Microsoft.VisualStudio.Composition.resources => 0xe759146b => 373
	i32 3885497537, ; 795: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 796: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 300
	i32 3888767677, ; 797: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 290
	i32 3889960447, ; 798: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 352
	i32 3896106733, ; 799: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 800: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 258
	i32 3900683505, ; 801: System.Composition.TypedParts => 0xe87fb4f1 => 226
	i32 3900914623, ; 802: ja\Microsoft.VisualStudio.Validation.resources => 0xe8833bbf => 412
	i32 3901907137, ; 803: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3917846462, ; 804: ru\Microsoft.VisualStudio.Validation.resources => 0xe98597be => 416
	i32 3920810846, ; 805: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 806: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 303
	i32 3928044579, ; 807: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 808: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 809: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 288
	i32 3936201068, ; 810: it/Microsoft.VisualStudio.Utilities.resources.dll => 0xea9da96c => 398
	i32 3945713374, ; 811: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 812: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 813: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 246
	i32 3958838348, ; 814: ru/Microsoft.VisualStudio.Validation.resources.dll => 0xebf7144c => 416
	i32 3959773229, ; 815: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 277
	i32 3980434154, ; 816: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 347
	i32 3983041280, ; 817: Microsoft.ServiceHub.Framework.dll => 0xed686300 => 193
	i32 3987592930, ; 818: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 329
	i32 4003436829, ; 819: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4009403246, ; 820: zh-Hant\Microsoft.ServiceHub.Resources => 0xeefaa36e => 207
	i32 4015948917, ; 821: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 245
	i32 4018628799, ; 822: es/Microsoft.VisualStudio.Utilities.resources.dll => 0xef8768bf => 396
	i32 4023392905, ; 823: System.IO.Pipelines => 0xefd01a89 => 231
	i32 4025784931, ; 824: System.Memory => 0xeff49a63 => 62
	i32 4042849247, ; 825: pl/Microsoft.ServiceHub.Resources.dll => 0xf0f8fbdf => 202
	i32 4043357644, ; 826: ko/StreamJsonRpc.resources.dll => 0xf100bdcc => 426
	i32 4046471985, ; 827: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4051437315, ; 828: pl/Microsoft.ServiceHub.Framework.resources.dll => 0xf17c0703 => 361
	i32 4054681211, ; 829: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4058387020, ; 830: ko/Microsoft.VisualStudio.Composition.resources.dll => 0xf1e6124c => 373
	i32 4061034150, ; 831: pl\Microsoft.VisualStudio.Validation.resources => 0xf20e76a6 => 414
	i32 4068434129, ; 832: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 833: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 834: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4097394248, ; 835: tr\Microsoft.VisualStudio.Utilities.resources => 0xf4394648 => 404
	i32 4099507663, ; 836: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 837: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 838: Xamarin.AndroidX.Emoji2 => 0xf479582c => 266
	i32 4102112229, ; 839: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 342
	i32 4122660923, ; 840: Microsoft.VisualStudio.Validation.dll => 0xf5bad03b => 215
	i32 4125707920, ; 841: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 337
	i32 4126470640, ; 842: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 843: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 844: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 845: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 846: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 349
	i32 4151237749, ; 847: System.Core => 0xf76edc75 => 21
	i32 4154687655, ; 848: en/Microsoft.VisualStudio.Utilities.resources.dll => 0xf7a380a7 => 395
	i32 4159265925, ; 849: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 850: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 851: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 852: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 853: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 282
	i32 4185676441, ; 854: System.Security => 0xf97c5a99 => 130
	i32 4187891719, ; 855: StreamJsonRpc => 0xf99e2807 => 219
	i32 4196529839, ; 856: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 857: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4227003137, ; 858: tr/Microsoft.ServiceHub.Framework.resources.dll => 0xfbf2f301 => 364
	i32 4229891530, ; 859: zh-Hant/Microsoft.ServiceHub.Resources.dll => 0xfc1f05ca => 207
	i32 4233285525, ; 860: de\Microsoft.VisualStudio.Threading.resources => 0xfc52cf95 => 381
	i32 4234971610, ; 861: zh-Hans\Microsoft.ServiceHub.Resources => 0xfc6c89da => 206
	i32 4256097574, ; 862: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 259
	i32 4258378803, ; 863: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 281
	i32 4259686643, ; 864: ja/Microsoft.VisualStudio.Composition.resources.dll => 0xfde5a8f3 => 372
	i32 4260525087, ; 865: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 866: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274976490, ; 867: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 868: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 282
	i32 4294763496 ; 869: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 268
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [870 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 194, ; 3
	i32 408, ; 4
	i32 278, ; 5
	i32 312, ; 6
	i32 48, ; 7
	i32 424, ; 8
	i32 218, ; 9
	i32 80, ; 10
	i32 145, ; 11
	i32 405, ; 12
	i32 216, ; 13
	i32 30, ; 14
	i32 353, ; 15
	i32 124, ; 16
	i32 193, ; 17
	i32 191, ; 18
	i32 102, ; 19
	i32 296, ; 20
	i32 420, ; 21
	i32 203, ; 22
	i32 107, ; 23
	i32 409, ; 24
	i32 296, ; 25
	i32 139, ; 26
	i32 316, ; 27
	i32 77, ; 28
	i32 124, ; 29
	i32 392, ; 30
	i32 424, ; 31
	i32 13, ; 32
	i32 252, ; 33
	i32 393, ; 34
	i32 132, ; 35
	i32 298, ; 36
	i32 151, ; 37
	i32 398, ; 38
	i32 363, ; 39
	i32 350, ; 40
	i32 351, ; 41
	i32 18, ; 42
	i32 250, ; 43
	i32 235, ; 44
	i32 26, ; 45
	i32 272, ; 46
	i32 1, ; 47
	i32 59, ; 48
	i32 42, ; 49
	i32 91, ; 50
	i32 255, ; 51
	i32 387, ; 52
	i32 147, ; 53
	i32 274, ; 54
	i32 271, ; 55
	i32 322, ; 56
	i32 54, ; 57
	i32 379, ; 58
	i32 69, ; 59
	i32 421, ; 60
	i32 354, ; 61
	i32 350, ; 62
	i32 241, ; 63
	i32 83, ; 64
	i32 390, ; 65
	i32 335, ; 66
	i32 273, ; 67
	i32 334, ; 68
	i32 131, ; 69
	i32 55, ; 70
	i32 375, ; 71
	i32 149, ; 72
	i32 74, ; 73
	i32 145, ; 74
	i32 62, ; 75
	i32 223, ; 76
	i32 146, ; 77
	i32 434, ; 78
	i32 165, ; 79
	i32 346, ; 80
	i32 358, ; 81
	i32 256, ; 82
	i32 12, ; 83
	i32 269, ; 84
	i32 125, ; 85
	i32 152, ; 86
	i32 399, ; 87
	i32 113, ; 88
	i32 166, ; 89
	i32 164, ; 90
	i32 271, ; 91
	i32 284, ; 92
	i32 84, ; 93
	i32 333, ; 94
	i32 327, ; 95
	i32 185, ; 96
	i32 209, ; 97
	i32 150, ; 98
	i32 316, ; 99
	i32 60, ; 100
	i32 205, ; 101
	i32 181, ; 102
	i32 369, ; 103
	i32 51, ; 104
	i32 103, ; 105
	i32 114, ; 106
	i32 176, ; 107
	i32 40, ; 108
	i32 209, ; 109
	i32 309, ; 110
	i32 361, ; 111
	i32 307, ; 112
	i32 400, ; 113
	i32 204, ; 114
	i32 120, ; 115
	i32 341, ; 116
	i32 387, ; 117
	i32 52, ; 118
	i32 44, ; 119
	i32 217, ; 120
	i32 119, ; 121
	i32 261, ; 122
	i32 339, ; 123
	i32 267, ; 124
	i32 81, ; 125
	i32 136, ; 126
	i32 303, ; 127
	i32 248, ; 128
	i32 8, ; 129
	i32 406, ; 130
	i32 73, ; 131
	i32 223, ; 132
	i32 321, ; 133
	i32 155, ; 134
	i32 318, ; 135
	i32 154, ; 136
	i32 429, ; 137
	i32 92, ; 138
	i32 313, ; 139
	i32 45, ; 140
	i32 336, ; 141
	i32 324, ; 142
	i32 175, ; 143
	i32 374, ; 144
	i32 0, ; 145
	i32 374, ; 146
	i32 317, ; 147
	i32 109, ; 148
	i32 129, ; 149
	i32 25, ; 150
	i32 238, ; 151
	i32 72, ; 152
	i32 55, ; 153
	i32 192, ; 154
	i32 213, ; 155
	i32 46, ; 156
	i32 345, ; 157
	i32 225, ; 158
	i32 184, ; 159
	i32 262, ; 160
	i32 22, ; 161
	i32 276, ; 162
	i32 230, ; 163
	i32 86, ; 164
	i32 174, ; 165
	i32 43, ; 166
	i32 160, ; 167
	i32 71, ; 168
	i32 289, ; 169
	i32 432, ; 170
	i32 432, ; 171
	i32 3, ; 172
	i32 358, ; 173
	i32 411, ; 174
	i32 42, ; 175
	i32 63, ; 176
	i32 355, ; 177
	i32 16, ; 178
	i32 53, ; 179
	i32 348, ; 180
	i32 312, ; 181
	i32 212, ; 182
	i32 422, ; 183
	i32 105, ; 184
	i32 218, ; 185
	i32 317, ; 186
	i32 310, ; 187
	i32 273, ; 188
	i32 34, ; 189
	i32 158, ; 190
	i32 85, ; 191
	i32 32, ; 192
	i32 12, ; 193
	i32 430, ; 194
	i32 51, ; 195
	i32 56, ; 196
	i32 293, ; 197
	i32 36, ; 198
	i32 180, ; 199
	i32 323, ; 200
	i32 311, ; 201
	i32 246, ; 202
	i32 35, ; 203
	i32 203, ; 204
	i32 58, ; 205
	i32 199, ; 206
	i32 280, ; 207
	i32 360, ; 208
	i32 173, ; 209
	i32 17, ; 210
	i32 314, ; 211
	i32 228, ; 212
	i32 413, ; 213
	i32 390, ; 214
	i32 164, ; 215
	i32 391, ; 216
	i32 408, ; 217
	i32 372, ; 218
	i32 336, ; 219
	i32 279, ; 220
	i32 183, ; 221
	i32 417, ; 222
	i32 204, ; 223
	i32 236, ; 224
	i32 306, ; 225
	i32 200, ; 226
	i32 407, ; 227
	i32 342, ; 228
	i32 153, ; 229
	i32 404, ; 230
	i32 302, ; 231
	i32 382, ; 232
	i32 287, ; 233
	i32 378, ; 234
	i32 340, ; 235
	i32 248, ; 236
	i32 29, ; 237
	i32 407, ; 238
	i32 52, ; 239
	i32 198, ; 240
	i32 338, ; 241
	i32 307, ; 242
	i32 429, ; 243
	i32 5, ; 244
	i32 322, ; 245
	i32 297, ; 246
	i32 301, ; 247
	i32 253, ; 248
	i32 318, ; 249
	i32 245, ; 250
	i32 403, ; 251
	i32 365, ; 252
	i32 264, ; 253
	i32 85, ; 254
	i32 382, ; 255
	i32 402, ; 256
	i32 306, ; 257
	i32 61, ; 258
	i32 112, ; 259
	i32 428, ; 260
	i32 201, ; 261
	i32 229, ; 262
	i32 399, ; 263
	i32 199, ; 264
	i32 370, ; 265
	i32 57, ; 266
	i32 352, ; 267
	i32 293, ; 268
	i32 99, ; 269
	i32 192, ; 270
	i32 19, ; 271
	i32 257, ; 272
	i32 111, ; 273
	i32 101, ; 274
	i32 102, ; 275
	i32 320, ; 276
	i32 104, ; 277
	i32 310, ; 278
	i32 71, ; 279
	i32 38, ; 280
	i32 32, ; 281
	i32 103, ; 282
	i32 73, ; 283
	i32 368, ; 284
	i32 326, ; 285
	i32 9, ; 286
	i32 123, ; 287
	i32 46, ; 288
	i32 247, ; 289
	i32 185, ; 290
	i32 9, ; 291
	i32 43, ; 292
	i32 356, ; 293
	i32 4, ; 294
	i32 294, ; 295
	i32 400, ; 296
	i32 330, ; 297
	i32 325, ; 298
	i32 31, ; 299
	i32 138, ; 300
	i32 92, ; 301
	i32 93, ; 302
	i32 345, ; 303
	i32 49, ; 304
	i32 141, ; 305
	i32 367, ; 306
	i32 397, ; 307
	i32 112, ; 308
	i32 417, ; 309
	i32 208, ; 310
	i32 140, ; 311
	i32 263, ; 312
	i32 430, ; 313
	i32 115, ; 314
	i32 311, ; 315
	i32 157, ; 316
	i32 76, ; 317
	i32 357, ; 318
	i32 79, ; 319
	i32 283, ; 320
	i32 37, ; 321
	i32 384, ; 322
	i32 305, ; 323
	i32 267, ; 324
	i32 428, ; 325
	i32 260, ; 326
	i32 64, ; 327
	i32 138, ; 328
	i32 15, ; 329
	i32 116, ; 330
	i32 299, ; 331
	i32 308, ; 332
	i32 360, ; 333
	i32 255, ; 334
	i32 48, ; 335
	i32 70, ; 336
	i32 80, ; 337
	i32 206, ; 338
	i32 126, ; 339
	i32 385, ; 340
	i32 94, ; 341
	i32 121, ; 342
	i32 315, ; 343
	i32 26, ; 344
	i32 197, ; 345
	i32 224, ; 346
	i32 385, ; 347
	i32 276, ; 348
	i32 97, ; 349
	i32 28, ; 350
	i32 251, ; 351
	i32 369, ; 352
	i32 343, ; 353
	i32 321, ; 354
	i32 149, ; 355
	i32 231, ; 356
	i32 169, ; 357
	i32 4, ; 358
	i32 423, ; 359
	i32 211, ; 360
	i32 98, ; 361
	i32 33, ; 362
	i32 93, ; 363
	i32 298, ; 364
	i32 181, ; 365
	i32 21, ; 366
	i32 41, ; 367
	i32 170, ; 368
	i32 337, ; 369
	i32 269, ; 370
	i32 394, ; 371
	i32 329, ; 372
	i32 176, ; 373
	i32 412, ; 374
	i32 363, ; 375
	i32 283, ; 376
	i32 194, ; 377
	i32 314, ; 378
	i32 308, ; 379
	i32 288, ; 380
	i32 2, ; 381
	i32 215, ; 382
	i32 359, ; 383
	i32 134, ; 384
	i32 111, ; 385
	i32 182, ; 386
	i32 236, ; 387
	i32 349, ; 388
	i32 238, ; 389
	i32 379, ; 390
	i32 346, ; 391
	i32 58, ; 392
	i32 201, ; 393
	i32 431, ; 394
	i32 95, ; 395
	i32 383, ; 396
	i32 397, ; 397
	i32 410, ; 398
	i32 328, ; 399
	i32 39, ; 400
	i32 174, ; 401
	i32 249, ; 402
	i32 25, ; 403
	i32 94, ; 404
	i32 229, ; 405
	i32 422, ; 406
	i32 89, ; 407
	i32 99, ; 408
	i32 10, ; 409
	i32 362, ; 410
	i32 220, ; 411
	i32 222, ; 412
	i32 87, ; 413
	i32 100, ; 414
	i32 295, ; 415
	i32 177, ; 416
	i32 315, ; 417
	i32 226, ; 418
	i32 240, ; 419
	i32 325, ; 420
	i32 381, ; 421
	i32 7, ; 422
	i32 280, ; 423
	i32 320, ; 424
	i32 237, ; 425
	i32 401, ; 426
	i32 419, ; 427
	i32 88, ; 428
	i32 376, ; 429
	i32 275, ; 430
	i32 154, ; 431
	i32 324, ; 432
	i32 33, ; 433
	i32 116, ; 434
	i32 195, ; 435
	i32 82, ; 436
	i32 371, ; 437
	i32 20, ; 438
	i32 11, ; 439
	i32 162, ; 440
	i32 3, ; 441
	i32 359, ; 442
	i32 425, ; 443
	i32 189, ; 444
	i32 332, ; 445
	i32 220, ; 446
	i32 184, ; 447
	i32 214, ; 448
	i32 182, ; 449
	i32 84, ; 450
	i32 319, ; 451
	i32 64, ; 452
	i32 334, ; 453
	i32 425, ; 454
	i32 302, ; 455
	i32 143, ; 456
	i32 284, ; 457
	i32 413, ; 458
	i32 157, ; 459
	i32 41, ; 460
	i32 117, ; 461
	i32 178, ; 462
	i32 239, ; 463
	i32 328, ; 464
	i32 291, ; 465
	i32 131, ; 466
	i32 75, ; 467
	i32 66, ; 468
	i32 338, ; 469
	i32 172, ; 470
	i32 418, ; 471
	i32 409, ; 472
	i32 243, ; 473
	i32 143, ; 474
	i32 106, ; 475
	i32 383, ; 476
	i32 151, ; 477
	i32 195, ; 478
	i32 70, ; 479
	i32 156, ; 480
	i32 177, ; 481
	i32 214, ; 482
	i32 121, ; 483
	i32 212, ; 484
	i32 127, ; 485
	i32 364, ; 486
	i32 333, ; 487
	i32 152, ; 488
	i32 200, ; 489
	i32 266, ; 490
	i32 141, ; 491
	i32 253, ; 492
	i32 406, ; 493
	i32 330, ; 494
	i32 20, ; 495
	i32 14, ; 496
	i32 414, ; 497
	i32 135, ; 498
	i32 75, ; 499
	i32 59, ; 500
	i32 256, ; 501
	i32 167, ; 502
	i32 168, ; 503
	i32 198, ; 504
	i32 187, ; 505
	i32 367, ; 506
	i32 15, ; 507
	i32 74, ; 508
	i32 6, ; 509
	i32 433, ; 510
	i32 23, ; 511
	i32 278, ; 512
	i32 228, ; 513
	i32 237, ; 514
	i32 91, ; 515
	i32 331, ; 516
	i32 197, ; 517
	i32 1, ; 518
	i32 136, ; 519
	i32 279, ; 520
	i32 301, ; 521
	i32 134, ; 522
	i32 69, ; 523
	i32 146, ; 524
	i32 340, ; 525
	i32 319, ; 526
	i32 402, ; 527
	i32 202, ; 528
	i32 270, ; 529
	i32 183, ; 530
	i32 88, ; 531
	i32 96, ; 532
	i32 260, ; 533
	i32 265, ; 534
	i32 335, ; 535
	i32 31, ; 536
	i32 45, ; 537
	i32 389, ; 538
	i32 274, ; 539
	i32 233, ; 540
	i32 239, ; 541
	i32 109, ; 542
	i32 158, ; 543
	i32 35, ; 544
	i32 22, ; 545
	i32 401, ; 546
	i32 114, ; 547
	i32 57, ; 548
	i32 299, ; 549
	i32 378, ; 550
	i32 144, ; 551
	i32 118, ; 552
	i32 120, ; 553
	i32 110, ; 554
	i32 241, ; 555
	i32 139, ; 556
	i32 247, ; 557
	i32 54, ; 558
	i32 388, ; 559
	i32 105, ; 560
	i32 341, ; 561
	i32 188, ; 562
	i32 189, ; 563
	i32 133, ; 564
	i32 313, ; 565
	i32 393, ; 566
	i32 304, ; 567
	i32 292, ; 568
	i32 347, ; 569
	i32 270, ; 570
	i32 211, ; 571
	i32 216, ; 572
	i32 210, ; 573
	i32 191, ; 574
	i32 159, ; 575
	i32 326, ; 576
	i32 257, ; 577
	i32 163, ; 578
	i32 132, ; 579
	i32 292, ; 580
	i32 161, ; 581
	i32 339, ; 582
	i32 281, ; 583
	i32 234, ; 584
	i32 140, ; 585
	i32 304, ; 586
	i32 300, ; 587
	i32 169, ; 588
	i32 190, ; 589
	i32 386, ; 590
	i32 233, ; 591
	i32 242, ; 592
	i32 309, ; 593
	i32 40, ; 594
	i32 268, ; 595
	i32 81, ; 596
	i32 232, ; 597
	i32 56, ; 598
	i32 37, ; 599
	i32 97, ; 600
	i32 235, ; 601
	i32 221, ; 602
	i32 366, ; 603
	i32 166, ; 604
	i32 362, ; 605
	i32 354, ; 606
	i32 172, ; 607
	i32 305, ; 608
	i32 366, ; 609
	i32 82, ; 610
	i32 244, ; 611
	i32 98, ; 612
	i32 30, ; 613
	i32 159, ; 614
	i32 227, ; 615
	i32 355, ; 616
	i32 18, ; 617
	i32 127, ; 618
	i32 119, ; 619
	i32 264, ; 620
	i32 433, ; 621
	i32 295, ; 622
	i32 277, ; 623
	i32 421, ; 624
	i32 227, ; 625
	i32 297, ; 626
	i32 0, ; 627
	i32 165, ; 628
	i32 272, ; 629
	i32 434, ; 630
	i32 294, ; 631
	i32 285, ; 632
	i32 170, ; 633
	i32 16, ; 634
	i32 395, ; 635
	i32 427, ; 636
	i32 144, ; 637
	i32 332, ; 638
	i32 213, ; 639
	i32 125, ; 640
	i32 118, ; 641
	i32 38, ; 642
	i32 115, ; 643
	i32 47, ; 644
	i32 142, ; 645
	i32 396, ; 646
	i32 411, ; 647
	i32 117, ; 648
	i32 196, ; 649
	i32 34, ; 650
	i32 173, ; 651
	i32 95, ; 652
	i32 53, ; 653
	i32 415, ; 654
	i32 370, ; 655
	i32 286, ; 656
	i32 394, ; 657
	i32 423, ; 658
	i32 415, ; 659
	i32 129, ; 660
	i32 153, ; 661
	i32 24, ; 662
	i32 380, ; 663
	i32 410, ; 664
	i32 161, ; 665
	i32 263, ; 666
	i32 234, ; 667
	i32 148, ; 668
	i32 175, ; 669
	i32 104, ; 670
	i32 217, ; 671
	i32 89, ; 672
	i32 251, ; 673
	i32 60, ; 674
	i32 142, ; 675
	i32 100, ; 676
	i32 5, ; 677
	i32 13, ; 678
	i32 122, ; 679
	i32 135, ; 680
	i32 28, ; 681
	i32 327, ; 682
	i32 375, ; 683
	i32 224, ; 684
	i32 72, ; 685
	i32 261, ; 686
	i32 24, ; 687
	i32 420, ; 688
	i32 208, ; 689
	i32 249, ; 690
	i32 290, ; 691
	i32 287, ; 692
	i32 418, ; 693
	i32 344, ; 694
	i32 137, ; 695
	i32 242, ; 696
	i32 258, ; 697
	i32 168, ; 698
	i32 377, ; 699
	i32 291, ; 700
	i32 323, ; 701
	i32 389, ; 702
	i32 101, ; 703
	i32 123, ; 704
	i32 262, ; 705
	i32 392, ; 706
	i32 419, ; 707
	i32 179, ; 708
	i32 163, ; 709
	i32 167, ; 710
	i32 265, ; 711
	i32 39, ; 712
	i32 356, ; 713
	i32 186, ; 714
	i32 426, ; 715
	i32 331, ; 716
	i32 431, ; 717
	i32 17, ; 718
	i32 171, ; 719
	i32 344, ; 720
	i32 343, ; 721
	i32 137, ; 722
	i32 150, ; 723
	i32 254, ; 724
	i32 155, ; 725
	i32 130, ; 726
	i32 210, ; 727
	i32 19, ; 728
	i32 65, ; 729
	i32 222, ; 730
	i32 147, ; 731
	i32 357, ; 732
	i32 221, ; 733
	i32 47, ; 734
	i32 351, ; 735
	i32 196, ; 736
	i32 240, ; 737
	i32 79, ; 738
	i32 61, ; 739
	i32 232, ; 740
	i32 380, ; 741
	i32 106, ; 742
	i32 289, ; 743
	i32 244, ; 744
	i32 49, ; 745
	i32 275, ; 746
	i32 348, ; 747
	i32 286, ; 748
	i32 14, ; 749
	i32 368, ; 750
	i32 178, ; 751
	i32 68, ; 752
	i32 371, ; 753
	i32 171, ; 754
	i32 250, ; 755
	i32 403, ; 756
	i32 254, ; 757
	i32 386, ; 758
	i32 376, ; 759
	i32 230, ; 760
	i32 353, ; 761
	i32 78, ; 762
	i32 259, ; 763
	i32 108, ; 764
	i32 391, ; 765
	i32 243, ; 766
	i32 377, ; 767
	i32 285, ; 768
	i32 67, ; 769
	i32 63, ; 770
	i32 27, ; 771
	i32 160, ; 772
	i32 388, ; 773
	i32 252, ; 774
	i32 10, ; 775
	i32 186, ; 776
	i32 11, ; 777
	i32 205, ; 778
	i32 405, ; 779
	i32 365, ; 780
	i32 78, ; 781
	i32 126, ; 782
	i32 83, ; 783
	i32 427, ; 784
	i32 180, ; 785
	i32 66, ; 786
	i32 107, ; 787
	i32 384, ; 788
	i32 65, ; 789
	i32 225, ; 790
	i32 128, ; 791
	i32 122, ; 792
	i32 219, ; 793
	i32 373, ; 794
	i32 77, ; 795
	i32 300, ; 796
	i32 290, ; 797
	i32 352, ; 798
	i32 8, ; 799
	i32 258, ; 800
	i32 226, ; 801
	i32 412, ; 802
	i32 2, ; 803
	i32 416, ; 804
	i32 44, ; 805
	i32 303, ; 806
	i32 156, ; 807
	i32 128, ; 808
	i32 288, ; 809
	i32 398, ; 810
	i32 23, ; 811
	i32 133, ; 812
	i32 246, ; 813
	i32 416, ; 814
	i32 277, ; 815
	i32 347, ; 816
	i32 193, ; 817
	i32 329, ; 818
	i32 29, ; 819
	i32 207, ; 820
	i32 245, ; 821
	i32 396, ; 822
	i32 231, ; 823
	i32 62, ; 824
	i32 202, ; 825
	i32 426, ; 826
	i32 188, ; 827
	i32 361, ; 828
	i32 90, ; 829
	i32 373, ; 830
	i32 414, ; 831
	i32 87, ; 832
	i32 148, ; 833
	i32 190, ; 834
	i32 404, ; 835
	i32 36, ; 836
	i32 86, ; 837
	i32 266, ; 838
	i32 342, ; 839
	i32 215, ; 840
	i32 337, ; 841
	i32 179, ; 842
	i32 50, ; 843
	i32 6, ; 844
	i32 90, ; 845
	i32 349, ; 846
	i32 21, ; 847
	i32 395, ; 848
	i32 162, ; 849
	i32 96, ; 850
	i32 50, ; 851
	i32 113, ; 852
	i32 282, ; 853
	i32 130, ; 854
	i32 219, ; 855
	i32 76, ; 856
	i32 27, ; 857
	i32 364, ; 858
	i32 207, ; 859
	i32 381, ; 860
	i32 206, ; 861
	i32 259, ; 862
	i32 281, ; 863
	i32 372, ; 864
	i32 7, ; 865
	i32 187, ; 866
	i32 110, ; 867
	i32 282, ; 868
	i32 268 ; 869
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
