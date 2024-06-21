; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [438 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [870 x i64] [
	i64 17802880886401652, ; 0: tr/Microsoft.VisualStudio.Threading.resources.dll => 0x3f3fa037366a74 => 390
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 265
	i64 33071413975074826, ; 2: Microsoft.VisualStudio.RemoteControl => 0x757e469a34480a => 209
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 185
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 190
	i64 177794975121655083, ; 6: ja/Microsoft.VisualStudio.Utilities.resources.dll => 0x277a7967ef9c52b => 399
	i64 196720943101637631, ; 7: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210390243030528795, ; 8: ru/Microsoft.ServiceHub.Resources.dll => 0x2eb74cfb40af31b => 204
	i64 210515253464952879, ; 9: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 252
	i64 229794953483747371, ; 10: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 11: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 293
	i64 279670469376841020, ; 12: zh-Hant\Microsoft.VisualStudio.Composition.resources => 0x3e196cf655f953c => 379
	i64 295915112840604065, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 296
	i64 311281864840114177, ; 14: ja\Microsoft.VisualStudio.Utilities.resources => 0x451e534f2d0f001 => 399
	i64 316157742385208084, ; 15: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 259
	i64 350667413455104241, ; 16: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 390014653889418737, ; 17: ja/Microsoft.VisualStudio.Validation.resources.dll => 0x5699c42e64695f1 => 412
	i64 408699061380389292, ; 18: Microsoft.VisualStudio.Utilities => 0x5abfda1859d19ac => 213
	i64 422779754995088667, ; 19: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 20: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 295
	i64 449765079935339303, ; 21: StreamJsonRpc.dll => 0x63de2f50debcb27 => 219
	i64 486738060028624626, ; 22: es/Microsoft.ServiceHub.Framework.resources.dll => 0x6c13dafceab3ef2 => 356
	i64 502670939551102150, ; 23: System.Management.dll => 0x6f9d88e66daf4c6 => 232
	i64 545109961164950392, ; 24: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 327
	i64 560278790331054453, ; 25: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 602010118039455382, ; 26: zh-Hans\Microsoft.VisualStudio.Utilities.resources => 0x85ac50344eec696 => 405
	i64 634308326490598313, ; 27: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 278
	i64 649145001856603771, ; 28: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 675799254782331204, ; 29: ko/Microsoft.VisualStudio.Threading.resources.dll => 0x960ebd778c64944 => 386
	i64 676272570642346617, ; 30: fr/Microsoft.ServiceHub.Resources.dll => 0x9629a51e87a3279 => 198
	i64 702024105029695270, ; 31: System.Drawing.Common => 0x9be17343c0e7726 => 230
	i64 750875890346172408, ; 32: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 775433664847856186, ; 33: it\Microsoft.VisualStudio.Composition.resources => 0xac2e4cf4c22c23a => 371
	i64 790155713624325618, ; 34: ru\Microsoft.ServiceHub.Framework.resources => 0xaf7326f63d2bdf2 => 363
	i64 798450721097591769, ; 35: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 253
	i64 799765834175365804, ; 36: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 807768407251849530, ; 37: zh-Hans\Microsoft.VisualStudio.Validation.resources => 0xb35c5162f07913a => 418
	i64 849051935479314978, ; 38: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 330
	i64 872800313462103108, ; 39: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 264
	i64 895210737996778430, ; 40: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 279
	i64 940822596282819491, ; 41: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 42: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 43: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 44: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 308
	i64 1121665720830085036, ; 45: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 338
	i64 1166741338400454851, ; 46: zh-Hant/Microsoft.VisualStudio.Validation.resources.dll => 0x10311910cc1f78c3 => 419
	i64 1182549588684364891, ; 47: zh-Hans\Microsoft.VisualStudio.Threading.resources => 0x10694295e2d0dc5b => 391
	i64 1268860745194512059, ; 48: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301626418029409250, ; 49: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 248
	i64 1369545283391376210, ; 51: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 286
	i64 1404195534211153682, ; 52: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 53: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 54: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 55: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 187
	i64 1492954217099365037, ; 56: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 57: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1534910729791260118, ; 58: zh-Hans/Microsoft.ServiceHub.Framework.resources.dll => 0x154d192d2b24c5d6 => 365
	i64 1537168428375924959, ; 59: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 60: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 336
	i64 1576750169145655260, ; 61: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 307
	i64 1624659445732251991, ; 62: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 247
	i64 1628611045998245443, ; 63: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 282
	i64 1636321030536304333, ; 64: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 272
	i64 1651782184287836205, ; 65: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 66: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1660779948839220459, ; 67: it/Microsoft.VisualStudio.Threading.resources.dll => 0x170c469074a734eb => 384
	i64 1682513316613008342, ; 68: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 69: Newtonsoft.Json => 0x18071957e9b889d7 => 218
	i64 1735388228521408345, ; 70: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 71: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 72: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 73: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 246
	i64 1825687700144851180, ; 74: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 75: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 326
	i64 1836611346387731153, ; 76: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 293
	i64 1854145951182283680, ; 77: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1865037103900624886, ; 78: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 176
	i64 1875417405349196092, ; 79: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 80: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 243
	i64 1881198190668717030, ; 81: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 348
	i64 1897575647115118287, ; 82: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 295
	i64 1911806496241183156, ; 83: tr\Microsoft.VisualStudio.Utilities.resources => 0x1a8819e10fbd69b4 => 404
	i64 1920760634179481754, ; 84: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 188
	i64 1959996714666907089, ; 85: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 348
	i64 1972385128188460614, ; 86: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 87: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 280
	i64 1983698669889758782, ; 88: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 322
	i64 2012959317730545784, ; 89: Data => 0x1bef77d598a45078 => 433
	i64 2019660174692588140, ; 90: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 340
	i64 2040001226662520565, ; 91: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 92: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 93: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 316
	i64 2080945842184875448, ; 94: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 95: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 96: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2130792593772371839, ; 97: es/Microsoft.ServiceHub.Resources.dll => 0x1d92189319d5df7f => 197
	i64 2133195048986300728, ; 98: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 218
	i64 2141794003861218914, ; 99: cs/Microsoft.VisualStudio.Validation.resources.dll => 0x1db92e4c7e35a662 => 407
	i64 2165310824878145998, ; 100: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 240
	i64 2165725771938924357, ; 101: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 250
	i64 2200176636225660136, ; 102: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 183
	i64 2262844636196693701, ; 103: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 264
	i64 2283599909513827695, ; 104: pt-BR/Microsoft.VisualStudio.Validation.resources.dll => 0x1fb0fa04c7af956f => 415
	i64 2287834202362508563, ; 105: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 106: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 107: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 344
	i64 2304837677853103545, ; 108: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 292
	i64 2315304989185124968, ; 109: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 110: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 275
	i64 2335283022205148317, ; 111: ko\Microsoft.VisualStudio.Composition.resources => 0x206897892c89dc9d => 373
	i64 2335503487726329082, ; 112: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 113: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2423932764996432979, ; 114: es/Microsoft.VisualStudio.Utilities.resources.dll => 0x21a38a01d90af453 => 396
	i64 2430359805989914396, ; 115: ko\Microsoft.VisualStudio.Utilities.resources => 0x21ba5f5df06a871c => 400
	i64 2470498323731680442, ; 116: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 257
	i64 2479423007379663237, ; 117: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 302
	i64 2497223385847772520, ; 118: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 119: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 241
	i64 2592350477072141967, ; 120: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 121: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 347
	i64 2624866290265602282, ; 122: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 123: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 124: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 179
	i64 2662981627730767622, ; 125: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 322
	i64 2704260652175460545, ; 126: System.Composition.Convention => 0x258776bc40fc08c1 => 223
	i64 2706075432581334785, ; 127: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 128: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 129: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 297
	i64 2796533598066548032, ; 130: de\Microsoft.ServiceHub.Resources => 0x26cf487da3339d40 => 196
	i64 2815524396660695947, ; 131: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2844780895111324988, ; 132: System.Composition.TypedParts => 0x277ab126dceda53c => 226
	i64 2851879596360956261, ; 133: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 227
	i64 2874659109084101369, ; 134: de/Microsoft.VisualStudio.Validation.resources.dll => 0x27e4d73aa74c7af9 => 408
	i64 2895129759130297543, ; 135: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 327
	i64 2923871038697555247, ; 136: Jsr305Binding => 0x2893ad37e69ec52f => 309
	i64 2957510711280508021, ; 137: zh-Hant/Microsoft.VisualStudio.Threading.resources.dll => 0x290b305285499c75 => 392
	i64 2991907748835029057, ; 138: de/StreamJsonRpc.resources.dll => 0x2985643eea0cf041 => 421
	i64 3017136373564924869, ; 139: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 140: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 308
	i64 3106852385031680087, ; 141: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 142: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 143: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3216235690883836477, ; 144: cs/Microsoft.VisualStudio.Utilities.resources.dll => 0x2ca25d520d106a3d => 393
	i64 3238539556702659506, ; 145: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 216
	i64 3281594302220646930, ; 146: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 147: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 273
	i64 3303437397778967116, ; 148: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 244
	i64 3311221304742556517, ; 149: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3321269044039068031, ; 150: MauiApp1 => 0x2e1784994573297f => 0
	i64 3325875462027654285, ; 151: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 152: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3341463492655001636, ; 153: it\Microsoft.ServiceHub.Framework.resources => 0x2e5f4357bda33024 => 358
	i64 3344514922410554693, ; 154: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 319
	i64 3373397458776442943, ; 155: tr/Microsoft.ServiceHub.Resources.dll => 0x2ed0b71da093483f => 205
	i64 3378246407733840341, ; 156: pl\Microsoft.VisualStudio.Threading.resources => 0x2ee1f13588b709d5 => 387
	i64 3429672777697402584, ; 157: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 190
	i64 3437845325506641314, ; 158: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 159: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 299
	i64 3494946837667399002, ; 160: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 177
	i64 3508450208084372758, ; 161: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 162: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 298
	i64 3531994851595924923, ; 163: System.Numerics => 0x31042a9aade235bb => 83
	i64 3532505434160716017, ; 164: pt-BR\Microsoft.ServiceHub.Framework.resources => 0x3105faf9f24958f1 => 362
	i64 3551103847008531295, ; 165: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 166: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 342
	i64 3571415421602489686, ; 167: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 168: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 178
	i64 3647754201059316852, ; 169: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 170: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 177
	i64 3659371656528649588, ; 171: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 238
	i64 3690127606734143618, ; 172: fr/Microsoft.VisualStudio.Validation.resources.dll => 0x3335f781d7404082 => 410
	i64 3716579019761409177, ; 173: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 174: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 291
	i64 3745789886814214634, ; 175: ko\Microsoft.ServiceHub.Framework.resources => 0x33fbb80e56cfd9ea => 360
	i64 3772598417116884899, ; 176: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 265
	i64 3774851544379141081, ; 177: it\Microsoft.ServiceHub.Resources => 0x3462f77ac68dabd9 => 199
	i64 3808596350265393157, ; 178: System.Diagnostics.PerformanceCounter.dll => 0x34dada33a66b0005 => 229
	i64 3829576749922459295, ; 179: cs/Microsoft.ServiceHub.Framework.resources.dll => 0x352563c39b391e9f => 354
	i64 3869221888984012293, ; 180: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 181
	i64 3869649043256705283, ; 181: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3875180953283865480, ; 182: MessagePack.dll => 0x35c7688ba0d82b88 => 174
	i64 3890352374528606784, ; 183: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 188
	i64 3892323582453208937, ; 184: ko/Microsoft.VisualStudio.Utilities.resources.dll => 0x36044fad02ffd769 => 400
	i64 3919223565570527920, ; 185: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 186: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 187: System.Memory => 0x370b03412596249e => 62
	i64 3986466921713458903, ; 188: System.Composition.Hosting => 0x3752c68b49935ed7 => 224
	i64 4006972109285359177, ; 189: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 190: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4020380517496724220, ; 191: MessagePack.Annotations.dll => 0x37cb42c79f4b1afc => 175
	i64 4073500526318903918, ; 192: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 193: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 186
	i64 4120493066591692148, ; 194: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 353
	i64 4148881117810174540, ; 195: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 196: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 197: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 198: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 199: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 200: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 259
	i64 4205801962323029395, ; 201: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4224288942162558427, ; 202: Microsoft.VisualStudio.Composition.dll => 0x3a9fb0696235bddb => 208
	i64 4235503420553921860, ; 203: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4237761919127609754, ; 204: tr\Microsoft.ServiceHub.Resources => 0x3acf8e034847619a => 205
	i64 4282138915307457788, ; 205: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321865999928413850, ; 206: System.Diagnostics.EventLog.dll => 0x3bfa5a3a8c924e9a => 228
	i64 4356591372459378815, ; 207: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 350
	i64 4373617458794931033, ; 208: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4397634830160618470, ; 209: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4462330757387019284, ; 210: Microsoft.ServiceHub.Resources => 0x3ded622e705a6414 => 194
	i64 4477672992252076438, ; 211: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 212: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4533124835995628778, ; 213: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4537536889469555869, ; 214: es/Microsoft.VisualStudio.Composition.resources.dll => 0x3ef891c29410549d => 369
	i64 4636684751163556186, ; 215: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 303
	i64 4654490921503260514, ; 216: fr\Microsoft.VisualStudio.Validation.resources => 0x409812d5227b7f62 => 410
	i64 4672453897036726049, ; 217: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 218: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 320
	i64 4692118866197340027, ; 219: pl/Microsoft.VisualStudio.Composition.resources.dll => 0x411dc13fb799df7b => 374
	i64 4716677666592453464, ; 220: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4723252672199750351, ; 221: zh-Hant\StreamJsonRpc.resources => 0x418c5d47cee172cf => 432
	i64 4743821336939966868, ; 222: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 223: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 277
	i64 4794310189461587505, ; 224: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 241
	i64 4795410492532947900, ; 225: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 298
	i64 4809057822547766521, ; 226: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 227: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 228: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 4952488434027013261, ; 229: pl/Microsoft.VisualStudio.Validation.resources.dll => 0x44bac5fdc869248d => 414
	i64 4966213257581017890, ; 230: it\Microsoft.VisualStudio.Threading.resources => 0x44eb88a548f3bb22 => 384
	i64 5002337827157170690, ; 231: zh-Hant\Microsoft.ServiceHub.Resources => 0x456bdfc01233da02 => 207
	i64 5051607678629112937, ; 232: es\Microsoft.ServiceHub.Framework.resources => 0x461aea6b4d52ec69 => 356
	i64 5055365687667823624, ; 233: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 242
	i64 5072195939344590231, ; 234: cs/Microsoft.VisualStudio.Threading.resources.dll => 0x46640f554bd02597 => 380
	i64 5081566143765835342, ; 235: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 236: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 237: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 238: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 239: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 284
	i64 5244375036463807528, ; 240: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 241: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 242: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 243: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 276
	i64 5287793306032704698, ; 244: zh-Hans/Microsoft.ServiceHub.Resources.dll => 0x496203fef3c48cba => 206
	i64 5290786973231294105, ; 245: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5313674019156125223, ; 246: de\Microsoft.ServiceHub.Framework.resources => 0x49bdf65e0c05e627 => 355
	i64 5340835533783596017, ; 247: cs/Microsoft.ServiceHub.Resources.dll => 0x4a1e759efaf47bf1 => 195
	i64 5376510917114486089, ; 248: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 302
	i64 5408338804355907810, ; 249: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 300
	i64 5423376490970181369, ; 250: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5424449234786381625, ; 251: cs\Microsoft.VisualStudio.Validation.resources => 0x4b4783d6cd94ef39 => 407
	i64 5435342863934572396, ; 252: ru/Microsoft.VisualStudio.Utilities.resources.dll => 0x4b6e37897d46476c => 403
	i64 5440320908473006344, ; 253: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 254: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 255: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 255
	i64 5457765010617926378, ; 256: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 257: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 346
	i64 5488847537322884930, ; 258: System.Windows.Extensions => 0x4c2c4dc108687f42 => 236
	i64 5499883080459888738, ; 259: Microsoft.VisualStudio.Threading => 0x4c538285a4fe2862 => 212
	i64 5507995362134886206, ; 260: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 261: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 349
	i64 5527431512186326818, ; 262: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 263: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 264: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 265: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 245
	i64 5591791169662171124, ; 266: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5635158070688529302, ; 267: es/Microsoft.VisualStudio.Validation.resources.dll => 0x4e341a68b090bb96 => 409
	i64 5650097808083101034, ; 268: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5676263520774316728, ; 269: Microsoft.VisualStudio.Validation => 0x4ec623991742e2b8 => 215
	i64 5681707193364847894, ; 270: pt-BR/StreamJsonRpc.resources.dll => 0x4ed97a96e24b1d16 => 428
	i64 5692067934154308417, ; 271: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 305
	i64 5724799082821825042, ; 272: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 268
	i64 5757522595884336624, ; 273: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 254
	i64 5783556987928984683, ; 274: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5815588864042668787, ; 275: de\StreamJsonRpc.resources => 0x50b51f4270fb12f3 => 421
	i64 5896680224035167651, ; 276: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 274
	i64 5924126145606300664, ; 277: pl\StreamJsonRpc.resources => 0x5236b9579177b3f8 => 427
	i64 5959344983920014087, ; 278: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 294
	i64 5979151488806146654, ; 279: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 280: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 5995750136392539833, ; 281: Data.dll => 0x53352efb71ad5eb9 => 433
	i64 6068057819846744445, ; 282: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 343
	i64 6102788177522843259, ; 283: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 294
	i64 6200764641006662125, ; 284: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 343
	i64 6222399776351216807, ; 285: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 286: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 287: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 288: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6315590403487358180, ; 289: fr\StreamJsonRpc.resources => 0x57a57c02b2badce4 => 423
	i64 6319713645133255417, ; 290: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 278
	i64 6355862529564748107, ; 291: Microsoft.ServiceHub.Resources.dll => 0x58348f4bbbec294b => 194
	i64 6357457916754632952, ; 292: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 434
	i64 6401687960814735282, ; 293: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 275
	i64 6435971861494892919, ; 294: cs/StreamJsonRpc.resources.dll => 0x59512a4f0cd00977 => 420
	i64 6474126617406440626, ; 295: Microsoft.VisualStudio.RpcContracts.dll => 0x59d8b7db6d6984b2 => 210
	i64 6478287442656530074, ; 296: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 331
	i64 6504860066809920875, ; 297: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 250
	i64 6548213210057960872, ; 298: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 261
	i64 6557084851308642443, ; 299: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 306
	i64 6560151584539558821, ; 300: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 184
	i64 6589202984700901502, ; 301: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 311
	i64 6591971792923354531, ; 302: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 276
	i64 6617685658146568858, ; 303: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6692579329111691486, ; 304: it/Microsoft.VisualStudio.Composition.resources.dll => 0x5ce0d170e6d310de => 371
	i64 6713049226152416138, ; 305: cs\Microsoft.VisualStudio.Threading.resources => 0x5d298ab43486938a => 380
	i64 6713440830605852118, ; 306: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739246970287767386, ; 307: tr/StreamJsonRpc.resources.dll => 0x5d869d69d5a13f5a => 430
	i64 6739853162153639747, ; 308: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 309: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 339
	i64 6746589141607518456, ; 310: pt-BR/Microsoft.VisualStudio.Utilities.resources.dll => 0x5da0b3144f0610f8 => 402
	i64 6766076348542393491, ; 311: Microsoft.ServiceHub.Framework.dll => 0x5de5ee973e0a9c93 => 193
	i64 6772837112740759457, ; 312: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 313: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 342
	i64 6786606130239981554, ; 314: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6791396597476077909, ; 315: de/Microsoft.VisualStudio.Utilities.resources.dll => 0x5e3fe339195bb155 => 394
	i64 6798329586179154312, ; 316: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 317: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 318: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 319: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6987056692196838363, ; 320: System.Management => 0x60f7030ae3e88bdb => 232
	i64 7011053663211085209, ; 321: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 270
	i64 7014127154236225539, ; 322: ru\Microsoft.ServiceHub.Resources => 0x61572f7bfdabf803 => 204
	i64 7060896174307865760, ; 323: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 324: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 325: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 326: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 271
	i64 7112547816752919026, ; 327: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7118095232192617785, ; 328: tr\Microsoft.VisualStudio.Composition.resources => 0x62c88de6803e1d39 => 377
	i64 7188876148444261747, ; 329: System.Composition.AttributedModel.dll => 0x63c404c4ca4c6d73 => 222
	i64 7192745174564810625, ; 330: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 240
	i64 7220009545223068405, ; 331: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 346
	i64 7270811800166795866, ; 332: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7284491514466782135, ; 333: pt-BR\Microsoft.ServiceHub.Resources => 0x6517b6700123cbb7 => 203
	i64 7299370801165188114, ; 334: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 335: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 336: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 337: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 239
	i64 7371656174704040109, ; 338: ru\Microsoft.VisualStudio.Composition.resources => 0x664d623bf38c98ad => 376
	i64 7377312882064240630, ; 339: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7488575175965059935, ; 340: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 341: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7584834483252033044, ; 342: pt-BR\Microsoft.VisualStudio.Validation.resources => 0x6942bec6be5ef614 => 415
	i64 7592577537120840276, ; 343: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7635299587268401828, ; 344: ja/Microsoft.ServiceHub.Framework.resources.dll => 0x69f6088564d1daa4 => 359
	i64 7637303409920963731, ; 345: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7643889328271876492, ; 346: fr\Microsoft.VisualStudio.Composition.resources => 0x6a148cd8520b618c => 370
	i64 7654504624184590948, ; 347: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7683996460257074599, ; 348: it\Microsoft.VisualStudio.Validation.resources => 0x6aa30a11acfb5da7 => 411
	i64 7692844685477678523, ; 349: de\Microsoft.VisualStudio.Composition.resources => 0x6ac2797ba6260dbb => 368
	i64 7694700312542370399, ; 350: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 351: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 337
	i64 7714652370974252055, ; 352: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 353: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 279
	i64 7735176074855944702, ; 354: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 355: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 314
	i64 7791074099216502080, ; 356: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 357: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 358: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 247
	i64 7889145416849571422, ; 359: fr/Microsoft.VisualStudio.Composition.resources.dll => 0x6d7bdff548b83e5e => 370
	i64 7921741049276291146, ; 360: ja/Microsoft.VisualStudio.Threading.resources.dll => 0x6defad835cbe584a => 385
	i64 8020916254412992903, ; 361: zh-Hant/Microsoft.ServiceHub.Resources.dll => 0x6f5004d635717187 => 207
	i64 8025517457475554965, ; 362: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 363: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8037258329461389554, ; 364: ru/StreamJsonRpc.resources.dll => 0x6f8a13de0f9878f2 => 429
	i64 8044118961405839122, ; 365: System.ComponentModel.Composition => 0x6fa2739369944712 => 221
	i64 8064050204834738623, ; 366: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 367: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 273
	i64 8085230611270010360, ; 368: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 369: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 370: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 371: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 372: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 373: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 374: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 318
	i64 8199901720993286004, ; 375: pl/StreamJsonRpc.resources.dll => 0x71cbe72b98eb4774 => 427
	i64 8202143405964630621, ; 376: de\Microsoft.VisualStudio.Threading.resources => 0x71d3ddf88d559a5d => 381
	i64 8246048515196606205, ; 377: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 191
	i64 8264926008854159966, ; 378: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 379: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8311982169281665208, ; 380: System.Threading.AccessControl => 0x735a17be836a18b8 => 235
	i64 8318905602908530212, ; 381: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 382: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 383: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 256
	i64 8400357532724379117, ; 384: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 288
	i64 8406449386989781371, ; 385: pt-BR/Microsoft.VisualStudio.Composition.resources.dll => 0x74a9b52d9dd3817b => 375
	i64 8410671156615598628, ; 386: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 387: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 277
	i64 8445070827284110693, ; 388: Microsoft.VisualStudio.Utilities.Internal => 0x7532eb2c6b489d65 => 214
	i64 8476857680833348370, ; 389: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 234
	i64 8518412311883997971, ; 390: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8540594166003620310, ; 391: ko/Microsoft.ServiceHub.Framework.resources.dll => 0x76864924db6b59d6 => 360
	i64 8563666267364444763, ; 392: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8568254372587209012, ; 393: it/Microsoft.VisualStudio.Utilities.resources.dll => 0x76e88df48f3f8134 => 398
	i64 8575739357155667659, ; 394: zh-Hant\Microsoft.VisualStudio.Utilities.resources => 0x770325825599aecb => 406
	i64 8595034769595574800, ; 395: ja\Microsoft.VisualStudio.Threading.resources => 0x7747b295a1e02a10 => 385
	i64 8598790081731763592, ; 396: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 267
	i64 8601935802264776013, ; 397: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 300
	i64 8605570381828407308, ; 398: en/Microsoft.VisualStudio.Utilities.resources.dll => 0x776d20ab0281400c => 395
	i64 8614108721271900878, ; 399: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 341
	i64 8623059219396073920, ; 400: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 401: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 402: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 403: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 287
	i64 8648495978913578441, ; 404: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 405: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 341
	i64 8684531736582871431, ; 406: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 407: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8740830839790451704, ; 408: fr\Microsoft.ServiceHub.Framework.resources => 0x794dab567f7d3bf8 => 357
	i64 8772037756965498393, ; 409: it/Microsoft.VisualStudio.Validation.resources.dll => 0x79bc89dd1c3e2e19 => 411
	i64 8825974560710680624, ; 410: pl/Microsoft.ServiceHub.Framework.resources.dll => 0x7a7c2919d7cb6030 => 361
	i64 8853378295825400934, ; 411: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 315
	i64 8907357455289697290, ; 412: es/Microsoft.VisualStudio.Threading.resources.dll => 0x7b9d4a6991f8440a => 382
	i64 8941376889969657626, ; 413: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 414: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 290
	i64 8954753533646919997, ; 415: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 8993496018399434829, ; 416: de/Microsoft.ServiceHub.Framework.resources.dll => 0x7ccf50faa996984d => 355
	i64 9045785047181495996, ; 417: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 351
	i64 9138683372487561558, ; 418: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9171069561746690957, ; 419: it\StreamJsonRpc.resources => 0x7f462f2d0e4f138d => 424
	i64 9312692141327339315, ; 420: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 305
	i64 9324707631942237306, ; 421: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 246
	i64 9360039450522429843, ; 422: fr/Microsoft.ServiceHub.Framework.resources.dll => 0x81e58a49e4082993 => 357
	i64 9468215723722196442, ; 423: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9554839972845591462, ; 424: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 425: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 310
	i64 9584643793929893533, ; 426: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9630107140230300349, ; 427: de\Microsoft.VisualStudio.Validation.resources => 0x85a5036bea6142bd => 408
	i64 9659729154652888475, ; 428: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 429: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 430: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 431: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 257
	i64 9679978064620295023, ; 432: it/StreamJsonRpc.resources.dll => 0x865630c35744136f => 424
	i64 9702891218465930390, ; 433: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9776375771063220978, ; 434: Nerdbank.Streams => 0x87aca9f760f57af2 => 217
	i64 9780093022148426479, ; 435: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 307
	i64 9808709177481450983, ; 436: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9823691751235222432, ; 437: zh-Hant\Microsoft.ServiceHub.Framework.resources => 0x8854c3997f4f7ba0 => 366
	i64 9825649861376906464, ; 438: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 254
	i64 9827080095733250167, ; 439: zh-Hant/Microsoft.ServiceHub.Framework.resources.dll => 0x8860cd47ed7df877 => 366
	i64 9834056768316610435, ; 440: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 441: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9844193899530095610, ; 442: ja\Microsoft.VisualStudio.Validation.resources => 0x889d9a31e18f0bfa => 412
	i64 9907349773706910547, ; 443: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 267
	i64 9933555792566666578, ; 444: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9956195530459977388, ; 445: Microsoft.Maui => 0x8a2b8315b36616ac => 189
	i64 9959489431142554298, ; 446: System.CodeDom => 0x8a3736deb7825aba => 220
	i64 9963664739326433656, ; 447: zh-Hans\Microsoft.ServiceHub.Framework.resources => 0x8a460c4a68a31978 => 365
	i64 9974604633896246661, ; 448: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9976963888860496507, ; 449: Microsoft.VisualStudio.Telemetry.dll => 0x8a754bcbf46e027b => 211
	i64 9991543690424095600, ; 450: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 326
	i64 10017511394021241210, ; 451: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 183
	i64 10038780035334861115, ; 452: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 453: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 454: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 455: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 456: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 187
	i64 10105485790837105934, ; 457: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 458: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 323
	i64 10151361150077311800, ; 459: Microsoft.VisualStudio.Utilities.Internal.dll => 0x8ce0e12e890f1b38 => 214
	i64 10224491876966872357, ; 460: ko/Microsoft.VisualStudio.Composition.resources.dll => 0x8de4b130bf7a3525 => 373
	i64 10226222362177979215, ; 461: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 316
	i64 10229024438826829339, ; 462: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 261
	i64 10236703004850800690, ; 463: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 464: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 465: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 313
	i64 10360651442923773544, ; 466: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 467: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 468: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 299
	i64 10406448008575299332, ; 469: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 319
	i64 10407550536276267806, ; 470: zh-Hant/Microsoft.VisualStudio.Composition.resources.dll => 0x906f0c1238ac531e => 379
	i64 10430153318873392755, ; 471: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 258
	i64 10447083246144586668, ; 472: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 176
	i64 10447615475279048428, ; 473: de\Microsoft.VisualStudio.Utilities.resources => 0x90fd62ebc1e1aeec => 394
	i64 10448061532586656644, ; 474: System.Composition.Convention.dll => 0x90fef89b91404384 => 223
	i64 10505221885553605938, ; 475: ja/Microsoft.VisualStudio.Composition.resources.dll => 0x91ca0ba55714fd32 => 372
	i64 10506226065143327199, ; 476: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 321
	i64 10546663366131771576, ; 477: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 478: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 479: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 480: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 481: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10785150219063592792, ; 482: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10822644899632537592, ; 483: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 484: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10835442135346987677, ; 485: pl/Microsoft.VisualStudio.Utilities.resources.dll => 0x965f3936a5a8429d => 401
	i64 10843446450579966237, ; 486: Microsoft.VisualStudio.Composition => 0x967ba91883ca091d => 208
	i64 10847732767863316357, ; 487: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 248
	i64 10899834349646441345, ; 488: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 489: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 490: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10991732737396536896, ; 491: zh-Hant/Microsoft.VisualStudio.Utilities.resources.dll => 0x988a7ab01e8d7640 => 406
	i64 11002576679268595294, ; 492: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 182
	i64 11009005086950030778, ; 493: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 189
	i64 11019817191295005410, ; 494: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 245
	i64 11023048688141570732, ; 495: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 496: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11047101296015504039, ; 497: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 216
	i64 11071824625609515081, ; 498: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 311
	i64 11078422477095414952, ; 499: MessagePack.Annotations => 0x99be768c02f9aca8 => 175
	i64 11079569176516935993, ; 500: ko\Microsoft.ServiceHub.Resources => 0x99c28976c6a8c139 => 201
	i64 11103970607964515343, ; 501: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 332
	i64 11128108736298314439, ; 502: ja\Microsoft.ServiceHub.Resources => 0x9a6efbefb8fb6ac7 => 200
	i64 11129765940661776577, ; 503: es\Microsoft.VisualStudio.Composition.resources => 0x9a74df27ae62f0c1 => 369
	i64 11136029745144976707, ; 504: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 309
	i64 11138965398324199724, ; 505: ru/Microsoft.VisualStudio.Composition.resources.dll => 0x9a958e03547b412c => 376
	i64 11162124722117608902, ; 506: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 304
	i64 11188319605227840848, ; 507: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 508: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 335
	i64 11226290749488709958, ; 509: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 184
	i64 11235648312900863002, ; 510: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 511: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 512: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 260
	i64 11341245327015630248, ; 513: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 227
	i64 11347436699239206956, ; 514: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11385656703440359675, ; 515: zh-Hant\Microsoft.VisualStudio.Validation.resources => 0x9e01fa72af1b90fb => 419
	i64 11392833485892708388, ; 516: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 289
	i64 11426995335776520728, ; 517: it/Microsoft.ServiceHub.Resources.dll => 0x9e94d7b70f014a18 => 199
	i64 11432086877643258359, ; 518: cs\Microsoft.ServiceHub.Resources => 0x9ea6ee720754b9f7 => 195
	i64 11432101114902388181, ; 519: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 520: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 521: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11465237565819292444, ; 522: ru/Microsoft.VisualStudio.Threading.resources.dll => 0x9f1cb4d2181f8b1c => 389
	i64 11482691884102096350, ; 523: fr/Microsoft.VisualStudio.Threading.resources.dll => 0x9f5ab76e412a95de => 383
	i64 11485890710487134646, ; 524: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 525: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 270
	i64 11513602507638267977, ; 526: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 231
	i64 11518296021396496455, ; 527: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 333
	i64 11529969570048099689, ; 528: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 304
	i64 11530571088791430846, ; 529: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 181
	i64 11580057168383206117, ; 530: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 243
	i64 11591352189662810718, ; 531: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 297
	i64 11597174155934063391, ; 532: fr\Microsoft.VisualStudio.Utilities.resources => 0xa0f170734aca5b1f => 397
	i64 11597940890313164233, ; 533: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11633085459938445148, ; 534: de/Microsoft.VisualStudio.Composition.resources.dll => 0xa17105975164875c => 368
	i64 11672361001936329215, ; 535: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 271
	i64 11692977985522001935, ; 536: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 537: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 329
	i64 11707554492040141440, ; 538: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 539: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11766809059788673038, ; 540: zh-Hans/Microsoft.VisualStudio.Threading.resources.dll => 0xa34c1a7f248d500e => 391
	i64 11890655789319506262, ; 541: ko/StreamJsonRpc.resources.dll => 0xa5041870e4d4c956 => 426
	i64 11938677804301963148, ; 542: tr/Microsoft.ServiceHub.Framework.resources.dll => 0xa5aeb4358d424f8c => 364
	i64 11991047634523762324, ; 543: System.Net => 0xa668c24ad493ae94 => 81
	i64 12008693925152623904, ; 544: pl\Microsoft.VisualStudio.Utilities.resources => 0xa6a77380091d0d20 => 401
	i64 12011556116648931059, ; 545: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 233
	i64 12040886584167504988, ; 546: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12063623837170009990, ; 547: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 548: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 549: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 550: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12124151557889122664, ; 551: pt-BR\Microsoft.VisualStudio.Utilities.resources => 0xa841a39afafae168 => 402
	i64 12137774235383566651, ; 552: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 301
	i64 12145679461940342714, ; 553: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 554: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 237
	i64 12201331334810686224, ; 555: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 556: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12313367145828839434, ; 557: System.IO.Pipelines => 0xaae1de2e1c17f00a => 231
	i64 12332222936682028543, ; 558: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12374012165002318533, ; 559: cs\Microsoft.VisualStudio.Composition.resources => 0xabb95280f55352c5 => 367
	i64 12375446203996702057, ; 560: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 561: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 269
	i64 12466513435562512481, ; 562: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 283
	i64 12471568088487385307, ; 563: fr\Microsoft.ServiceHub.Resources => 0xad13e9196a6358db => 198
	i64 12475113361194491050, ; 564: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 434
	i64 12481884125606176949, ; 565: zh-Hant/StreamJsonRpc.resources.dll => 0xad388f7afa57e8b5 => 432
	i64 12487638416075308985, ; 566: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 263
	i64 12517810545449516888, ; 567: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 568: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 251
	i64 12550732019250633519, ; 569: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12573751959656727467, ; 570: ru/Microsoft.VisualStudio.Validation.resources.dll => 0xae7ef0c9e93603ab => 416
	i64 12603216663576844694, ; 571: de/Microsoft.VisualStudio.Threading.resources.dll => 0xaee79ec7e3c81996 => 381
	i64 12681088699309157496, ; 572: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 334
	i64 12699999919562409296, ; 573: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 574: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 252
	i64 12708238894395270091, ; 575: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 576: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 577: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12726057104018228727, ; 578: Microsoft.NET.StringTools => 0xb09c0982b457c5f7 => 192
	i64 12753841065332862057, ; 579: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 306
	i64 12808034783427285688, ; 580: cs\StreamJsonRpc.resources => 0xb1bf47c69107d2b8 => 420
	i64 12823819093633476069, ; 581: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 347
	i64 12828192437253469131, ; 582: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 317
	i64 12835242264250840079, ; 583: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 584: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 185
	i64 12843770487262409629, ; 585: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12848781286208560954, ; 586: Microsoft.VisualStudio.Telemetry => 0xb2500a810925df3a => 211
	i64 12859557719246324186, ; 587: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12928116100519456705, ; 588: es\Microsoft.VisualStudio.Utilities.resources => 0xb369e518ea786fc1 => 396
	i64 12963446364377008305, ; 589: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 230
	i64 12982280885948128408, ; 590: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 262
	i64 13000926602004112928, ; 591: zh-Hans\Microsoft.VisualStudio.Composition.resources => 0xb46c91dcd761a620 => 378
	i64 13019838822340531700, ; 592: cs/Microsoft.VisualStudio.Composition.resources.dll => 0xb4afc26d467295f4 => 367
	i64 13056519019444193772, ; 593: MauiApp1.dll => 0xb53212df2d1a49ec => 0
	i64 13068258254871114833, ; 594: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13072259076476491058, ; 595: tr\StreamJsonRpc.resources => 0xb569fe5ec941d532 => 430
	i64 13126023683090012938, ; 596: System.Composition.TypedParts.dll => 0xb62900febff1db0a => 226
	i64 13129914918964716986, ; 597: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 266
	i64 13130412034557475351, ; 598: fr\Microsoft.VisualStudio.Threading.resources => 0xb638982d724ffa17 => 383
	i64 13162471042547327635, ; 599: System.Security.Permissions => 0xb6aa7dace9662293 => 234
	i64 13173818576982874404, ; 600: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 601: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 321
	i64 13222659110913276082, ; 602: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 335
	i64 13244563641972016158, ; 603: pt-BR/Microsoft.ServiceHub.Framework.resources.dll => 0xb7ce2475accbc41e => 362
	i64 13343850469010654401, ; 604: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 605: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 606: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 329
	i64 13401370062847626945, ; 607: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 301
	i64 13404347523447273790, ; 608: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 256
	i64 13431476299110033919, ; 609: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 610: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 312
	i64 13463706743370286408, ; 611: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 612: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 314
	i64 13467053111158216594, ; 613: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 349
	i64 13491513212026656886, ; 614: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 249
	i64 13502641473732064860, ; 615: System.Composition.AttributedModel => 0xbb6304e15b41b65c => 222
	i64 13540124433173649601, ; 616: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 350
	i64 13545416393490209236, ; 617: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 333
	i64 13572454107664307259, ; 618: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 291
	i64 13578472628727169633, ; 619: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 620: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 621: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 262
	i64 13647894001087880694, ; 622: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 623: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 242
	i64 13702626353344114072, ; 624: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13703125838636057883, ; 625: Microsoft.VisualStudio.Validation.dll => 0xbe2b48591461051b => 215
	i64 13710614125866346983, ; 626: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 627: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 628: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 629: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 328
	i64 13768883594457632599, ; 630: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 631: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 331
	i64 13819460841644211703, ; 632: es\Microsoft.ServiceHub.Resources => 0xbfc8966ab59fbdf7 => 197
	i64 13828521679616088467, ; 633: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 315
	i64 13859681129916375842, ; 634: tr\Microsoft.VisualStudio.Validation.resources => 0xc0577a8e50d9a322 => 417
	i64 13881769479078963060, ; 635: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 636: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 236
	i64 13911222732217019342, ; 637: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 638: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13959074834287824816, ; 639: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 269
	i64 13988492781996941750, ; 640: ja\Microsoft.ServiceHub.Framework.resources => 0xc2211c122e0b21b6 => 359
	i64 14043772898905986081, ; 641: tr/Microsoft.VisualStudio.Utilities.resources.dll => 0xc2e5810b618c9421 => 404
	i64 14075334701871371868, ; 642: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 643: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 323
	i64 14124974489674258913, ; 644: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 251
	i64 14125464355221830302, ; 645: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14175074915974767561, ; 646: zh-Hans\Microsoft.ServiceHub.Resources => 0xc4b7fb888739e3c9 => 206
	i64 14178052285788134900, ; 647: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 238
	i64 14212104595480609394, ; 648: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 649: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 650: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 651: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 652: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 653: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 289
	i64 14298246716367104064, ; 654: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 655: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 656: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14330684041385202088, ; 657: pt-BR/Microsoft.VisualStudio.Threading.resources.dll => 0xc6e0d1355b1fd1a8 => 388
	i64 14331727281556788554, ; 658: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 239
	i64 14346402571976470310, ; 659: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14370252628338276234, ; 660: tr/Microsoft.VisualStudio.Validation.resources.dll => 0xc76d64a0ecb9f78a => 417
	i64 14391267691003248864, ; 661: Nerdbank.Streams.dll => 0xc7b80db77dce00e0 => 217
	i64 14415297290983905433, ; 662: pt-BR\StreamJsonRpc.resources => 0xc80d6c82b8bf1899 => 428
	i64 14452298576064698508, ; 663: es\Microsoft.VisualStudio.Validation.resources => 0xc890e0fbbe38588c => 409
	i64 14461014870687870182, ; 664: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 665: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 344
	i64 14486659737292545672, ; 666: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 274
	i64 14495724990987328804, ; 667: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 292
	i64 14522721392235705434, ; 668: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 325
	i64 14551742072151931844, ; 669: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 670: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 671: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14614774114972620539, ; 672: zh-Hans/Microsoft.VisualStudio.Composition.resources.dll => 0xcad21ba00b8456fb => 378
	i64 14622043554576106986, ; 673: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14636892923918804708, ; 674: ja/StreamJsonRpc.resources.dll => 0xcb20b090919be6e4 => 425
	i64 14644440854989303794, ; 675: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 284
	i64 14656309759869513278, ; 676: Microsoft.VisualStudio.RemoteControl.dll => 0xcb65ac12fb1cee3e => 209
	i64 14669215534098758659, ; 677: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 179
	i64 14690985099581930927, ; 678: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 679: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 336
	i64 14744092281598614090, ; 680: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 352
	i64 14753596820584604397, ; 681: zh-Hans/StreamJsonRpc.resources.dll => 0xccbf4e23f24722ed => 431
	i64 14771404191615744121, ; 682: pl\Microsoft.VisualStudio.Composition.resources => 0xccfe91d99af8f879 => 374
	i64 14792063746108907174, ; 683: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 312
	i64 14819209644871321045, ; 684: zh-Hans/Microsoft.VisualStudio.Utilities.resources.dll => 0xcda868a80e9905d5 => 405
	i64 14820817770416679739, ; 685: tr\Microsoft.VisualStudio.Threading.resources => 0xcdae1f3cf67bab3b => 390
	i64 14832630590065248058, ; 686: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14847150824983734404, ; 687: Microsoft.VisualStudio.RpcContracts => 0xce0bad0301cda884 => 210
	i64 14852515768018889994, ; 688: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 260
	i64 14889905118082851278, ; 689: GoogleGson.dll => 0xcea391d0969961ce => 173
	i64 14892012299694389861, ; 690: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 353
	i64 14904040806490515477, ; 691: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 320
	i64 14912225920358050525, ; 692: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 693: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 694: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 180
	i64 14984936317414011727, ; 695: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 696: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 697: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 263
	i64 15015154896917945444, ; 698: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15023260263817286165, ; 699: es/StreamJsonRpc.resources.dll => 0xd07d579d01121215 => 422
	i64 15023528575408771796, ; 700: ko\StreamJsonRpc.resources => 0xd07e4ba42a2b92d4 => 426
	i64 15024878362326791334, ; 701: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15044901218619597537, ; 702: en\Microsoft.VisualStudio.Utilities.resources => 0xd0ca39f270a9a2e1 => 395
	i64 15071021337266399595, ; 703: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 704: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15078030747917693565, ; 705: pl/Microsoft.VisualStudio.Threading.resources.dll => 0xd13fed14120d327d => 387
	i64 15111608613780139878, ; 706: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 337
	i64 15115185479366240210, ; 707: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 708: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 709: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 290
	i64 15201252454341482878, ; 710: ja\StreamJsonRpc.resources => 0xd2f5b2914a0f197e => 425
	i64 15227001540531775957, ; 711: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 178
	i64 15234786388537674379, ; 712: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15237913642941303365, ; 713: pl\Microsoft.ServiceHub.Framework.resources => 0xd377f1b96d984a45 => 361
	i64 15249474349747396247, ; 714: zh-Hans\StreamJsonRpc.resources => 0xd3a104203c1fde97 => 431
	i64 15250465174479574862, ; 715: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 716: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 253
	i64 15279429628684179188, ; 717: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 318
	i64 15299439993936780255, ; 718: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15300862763834473199, ; 719: System.Composition.Hosting.dll => 0xd457959dc35afaef => 224
	i64 15338463749992804988, ; 720: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15352427450275134006, ; 721: System.Composition.Runtime.dll => 0xd50ec76ce59afa36 => 225
	i64 15370334346939861994, ; 722: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 258
	i64 15391712275433856905, ; 723: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 180
	i64 15455258289457179632, ; 724: pl/Microsoft.ServiceHub.Resources.dll => 0xd67c1b875f01abf0 => 202
	i64 15475196252089753159, ; 725: System.Diagnostics.EventLog => 0xd6c2f1000b441e47 => 228
	i64 15485751695148966188, ; 726: pt-BR/Microsoft.ServiceHub.Resources.dll => 0xd6e8711ea541e12c => 203
	i64 15526743539506359484, ; 727: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 728: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 729: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 730: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 324
	i64 15541854775306130054, ; 731: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 732: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15558627161509849899, ; 733: ru\Microsoft.VisualStudio.Validation.resources => 0xd7eb58f86289eb2b => 416
	i64 15582737692548360875, ; 734: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 282
	i64 15609085926864131306, ; 735: System.dll => 0xd89e9cf3334914ea => 164
	i64 15661133872274321916, ; 736: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 737: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 324
	i64 15686827046011320720, ; 738: it\Microsoft.VisualStudio.Utilities.resources => 0xd9b2ce16027eb990 => 398
	i64 15710114879900314733, ; 739: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 740: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 332
	i64 15750798694401567573, ; 741: ru\Microsoft.VisualStudio.Threading.resources => 0xda9613f6147deb55 => 389
	i64 15755368083429170162, ; 742: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 743: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 296
	i64 15783653065526199428, ; 744: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 325
	i64 15817206913877585035, ; 745: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 746: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 747: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15903718333706527842, ; 748: zh-Hans/Microsoft.VisualStudio.Validation.resources.dll => 0xdcb55b902071e462 => 418
	i64 15928521404965645318, ; 749: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 186
	i64 15934062614519587357, ; 750: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 751: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15953812885175980916, ; 752: ko\Microsoft.VisualStudio.Validation.resources => 0xdd67544ac9f6d374 => 413
	i64 15963349826457351533, ; 753: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 754: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 755: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16054465462676478687, ; 756: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16090829755721178160, ; 757: tr\Microsoft.ServiceHub.Framework.resources => 0xdf4e1c68f30bdc30 => 364
	i64 16091261637069827414, ; 758: ko/Microsoft.VisualStudio.Validation.resources.dll => 0xdf4fa534296aed56 => 413
	i64 16131251062481977478, ; 759: pl\Microsoft.ServiceHub.Resources => 0xdfddb75fd1e18086 => 202
	i64 16154507427712707110, ; 760: System => 0xe03056ea4e39aa26 => 164
	i64 16177821557421402585, ; 761: StreamJsonRpc => 0xe0832afe21c269d9 => 219
	i64 16201041905702586336, ; 762: System.Diagnostics.PerformanceCounter => 0xe0d5a9c6c49ec7e0 => 229
	i64 16219561732052121626, ; 763: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16236971995090710244, ; 764: pt-BR\Microsoft.VisualStudio.Composition.resources => 0xe15550009b58eee4 => 375
	i64 16288847719894691167, ; 765: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 338
	i64 16315482530584035869, ; 766: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 767: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 182
	i64 16337011941688632206, ; 768: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361933716545543812, ; 769: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 268
	i64 16423015068819898779, ; 770: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 317
	i64 16454459195343277943, ; 771: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 772: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16520416485536215268, ; 773: es\Microsoft.VisualStudio.Threading.resources => 0xe5444f43c1e4b0e4 => 382
	i64 16565028646146589191, ; 774: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 221
	i64 16582434033142728747, ; 775: Microsoft.NET.StringTools.dll => 0xe620a3e548d2082b => 192
	i64 16583419235299384312, ; 776: ko\Microsoft.VisualStudio.Threading.resources => 0xe62423ee89665bf8 => 386
	i64 16584736615512946867, ; 777: Microsoft.VisualStudio.Utilities.dll => 0xe628d215051038b3 => 213
	i64 16589693266713801121, ; 778: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 281
	i64 16621146507174665210, ; 779: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 255
	i64 16643194905613199096, ; 780: System.Composition.Runtime => 0xe6f8819654aa66f8 => 225
	i64 16649148416072044166, ; 781: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 191
	i64 16677317093839702854, ; 782: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 288
	i64 16702652415771857902, ; 783: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 784: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 785: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 786: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 787: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 788: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16800021547249663972, ; 789: Microsoft.ServiceHub.Framework => 0xe925aa963eb97fe4 => 193
	i64 16822611501064131242, ; 790: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16827289987956835956, ; 791: cs\Microsoft.VisualStudio.Utilities.resources => 0xe9868b16d8a78674 => 393
	i64 16833383113903931215, ; 792: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 793: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16870847574843270873, ; 794: de/Microsoft.ServiceHub.Resources.dll => 0xea214a7bd64b26d9 => 196
	i64 16890310621557459193, ; 795: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 796: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 797: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 345
	i64 16977952268158210142, ; 798: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 799: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 281
	i64 16998075588627545693, ; 800: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 286
	i64 17008137082415910100, ; 801: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17018932226584424969, ; 802: pt-BR\Microsoft.VisualStudio.Threading.resources => 0xec2f64b09e033209 => 388
	i64 17024911836938395553, ; 803: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 244
	i64 17031351772568316411, ; 804: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 285
	i64 17037200463775726619, ; 805: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 272
	i64 17062143951396181894, ; 806: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 807: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 352
	i64 17118171214553292978, ; 808: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17160917431135180830, ; 809: ru\Microsoft.VisualStudio.Utilities.resources => 0xee27d37b2e9f181e => 403
	i64 17180572832852637353, ; 810: es\StreamJsonRpc.resources => 0xee6da7f703e876a9 => 422
	i64 17187273293601214786, ; 811: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 812: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 813: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17230721278011714856, ; 814: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 815: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 816: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17333249706306540043, ; 817: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 818: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 819: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 330
	i64 17346290192329067203, ; 820: zh-Hant\Microsoft.VisualStudio.Threading.resources => 0xf0ba67067c9dcac3 => 392
	i64 17360349973592121190, ; 821: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 310
	i64 17438153253682247751, ; 822: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 345
	i64 17470386307322966175, ; 823: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17490334362188023649, ; 824: pl\Microsoft.VisualStudio.Validation.resources => 0xf2ba266f45068761 => 414
	i64 17509662556995089465, ; 825: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 826: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 328
	i64 17522591619082469157, ; 827: GoogleGson => 0xf32cc03d27a5bf25 => 173
	i64 17523946658117960076, ; 828: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 233
	i64 17590473451926037903, ; 829: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 237
	i64 17623389608345532001, ; 830: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 340
	i64 17627500474728259406, ; 831: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 832: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 833: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 351
	i64 17704177640604968747, ; 834: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 283
	i64 17710060891934109755, ; 835: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 280
	i64 17712670374920797664, ; 836: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17743407583038752114, ; 837: System.CodeDom.dll => 0xf63d3f302bff4572 => 220
	i64 17777860260071588075, ; 838: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17801122059615118823, ; 839: Microsoft.VisualStudio.Threading.dll => 0xf70a4a32e6baa5e7 => 212
	i64 17806780683907942013, ; 840: ja\Microsoft.VisualStudio.Composition.resources => 0xf71e64b0099ec67d => 372
	i64 17830918774018250459, ; 841: ja/Microsoft.ServiceHub.Resources.dll => 0xf7742627183396db => 200
	i64 17838668724098252521, ; 842: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17849620690824033494, ; 843: cs\Microsoft.ServiceHub.Framework.resources => 0xf7b697726c0774d6 => 354
	i64 17852204549962223340, ; 844: ko/Microsoft.ServiceHub.Resources.dll => 0xf7bfc574021c4eec => 201
	i64 17859375626191382484, ; 845: fr/Microsoft.VisualStudio.Utilities.resources.dll => 0xf7d93f824d6827d4 => 397
	i64 17872609556538910715, ; 846: ru/Microsoft.ServiceHub.Framework.resources.dll => 0xf80843b2d2c0e7fb => 363
	i64 17891337867145587222, ; 847: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 313
	i64 17894845729534052403, ; 848: tr/Microsoft.VisualStudio.Composition.resources.dll => 0xf85743614b4b0833 => 377
	i64 17928294245072900555, ; 849: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17967933707255284319, ; 850: it/Microsoft.ServiceHub.Framework.resources.dll => 0xf95aec8230b8025f => 358
	i64 17992315986609351877, ; 851: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18025913125965088385, ; 852: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 853: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 339
	i64 18116111925905154859, ; 854: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 249
	i64 18121036031235206392, ; 855: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 285
	i64 18123834358115542242, ; 856: fr/StreamJsonRpc.resources.dll => 0xfb84cb53137f24e2 => 423
	i64 18146411883821974900, ; 857: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 858: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18166800034629147097, ; 859: ru\StreamJsonRpc.resources => 0xfc1d7061319fd9d9 => 429
	i64 18171003490741864161, ; 860: MessagePack => 0xfc2c5f66960d46e1 => 174
	i64 18225059387460068507, ; 861: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18236439618683771511, ; 862: System.Threading.AccessControl.dll => 0xfd14d9365f819a77 => 235
	i64 18245806341561545090, ; 863: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 864: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 266
	i64 18305135509493619199, ; 865: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 287
	i64 18318849532986632368, ; 866: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 867: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 334
	i64 18380184030268848184, ; 868: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 303
	i64 18439108438687598470 ; 869: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [870 x i32] [
	i32 390, ; 0
	i32 265, ; 1
	i32 209, ; 2
	i32 185, ; 3
	i32 171, ; 4
	i32 190, ; 5
	i32 399, ; 6
	i32 58, ; 7
	i32 204, ; 8
	i32 252, ; 9
	i32 151, ; 10
	i32 293, ; 11
	i32 379, ; 12
	i32 296, ; 13
	i32 399, ; 14
	i32 259, ; 15
	i32 132, ; 16
	i32 412, ; 17
	i32 213, ; 18
	i32 56, ; 19
	i32 295, ; 20
	i32 219, ; 21
	i32 356, ; 22
	i32 232, ; 23
	i32 327, ; 24
	i32 95, ; 25
	i32 405, ; 26
	i32 278, ; 27
	i32 129, ; 28
	i32 386, ; 29
	i32 198, ; 30
	i32 230, ; 31
	i32 145, ; 32
	i32 371, ; 33
	i32 363, ; 34
	i32 253, ; 35
	i32 18, ; 36
	i32 418, ; 37
	i32 330, ; 38
	i32 264, ; 39
	i32 279, ; 40
	i32 150, ; 41
	i32 104, ; 42
	i32 95, ; 43
	i32 308, ; 44
	i32 338, ; 45
	i32 419, ; 46
	i32 391, ; 47
	i32 36, ; 48
	i32 28, ; 49
	i32 248, ; 50
	i32 286, ; 51
	i32 50, ; 52
	i32 115, ; 53
	i32 70, ; 54
	i32 187, ; 55
	i32 65, ; 56
	i32 170, ; 57
	i32 365, ; 58
	i32 145, ; 59
	i32 336, ; 60
	i32 307, ; 61
	i32 247, ; 62
	i32 282, ; 63
	i32 272, ; 64
	i32 40, ; 65
	i32 89, ; 66
	i32 384, ; 67
	i32 81, ; 68
	i32 218, ; 69
	i32 66, ; 70
	i32 62, ; 71
	i32 86, ; 72
	i32 246, ; 73
	i32 106, ; 74
	i32 326, ; 75
	i32 293, ; 76
	i32 102, ; 77
	i32 176, ; 78
	i32 35, ; 79
	i32 243, ; 80
	i32 348, ; 81
	i32 295, ; 82
	i32 404, ; 83
	i32 188, ; 84
	i32 348, ; 85
	i32 119, ; 86
	i32 280, ; 87
	i32 322, ; 88
	i32 433, ; 89
	i32 340, ; 90
	i32 142, ; 91
	i32 141, ; 92
	i32 316, ; 93
	i32 53, ; 94
	i32 35, ; 95
	i32 141, ; 96
	i32 197, ; 97
	i32 218, ; 98
	i32 407, ; 99
	i32 240, ; 100
	i32 250, ; 101
	i32 183, ; 102
	i32 264, ; 103
	i32 415, ; 104
	i32 8, ; 105
	i32 14, ; 106
	i32 344, ; 107
	i32 292, ; 108
	i32 51, ; 109
	i32 275, ; 110
	i32 373, ; 111
	i32 136, ; 112
	i32 101, ; 113
	i32 396, ; 114
	i32 400, ; 115
	i32 257, ; 116
	i32 302, ; 117
	i32 116, ; 118
	i32 241, ; 119
	i32 163, ; 120
	i32 347, ; 121
	i32 166, ; 122
	i32 67, ; 123
	i32 179, ; 124
	i32 322, ; 125
	i32 223, ; 126
	i32 80, ; 127
	i32 101, ; 128
	i32 297, ; 129
	i32 196, ; 130
	i32 117, ; 131
	i32 226, ; 132
	i32 227, ; 133
	i32 408, ; 134
	i32 327, ; 135
	i32 309, ; 136
	i32 392, ; 137
	i32 421, ; 138
	i32 78, ; 139
	i32 308, ; 140
	i32 114, ; 141
	i32 121, ; 142
	i32 48, ; 143
	i32 393, ; 144
	i32 216, ; 145
	i32 128, ; 146
	i32 273, ; 147
	i32 244, ; 148
	i32 82, ; 149
	i32 0, ; 150
	i32 110, ; 151
	i32 75, ; 152
	i32 358, ; 153
	i32 319, ; 154
	i32 205, ; 155
	i32 387, ; 156
	i32 190, ; 157
	i32 53, ; 158
	i32 299, ; 159
	i32 177, ; 160
	i32 69, ; 161
	i32 298, ; 162
	i32 83, ; 163
	i32 362, ; 164
	i32 172, ; 165
	i32 342, ; 166
	i32 116, ; 167
	i32 178, ; 168
	i32 156, ; 169
	i32 177, ; 170
	i32 238, ; 171
	i32 410, ; 172
	i32 167, ; 173
	i32 291, ; 174
	i32 360, ; 175
	i32 265, ; 176
	i32 199, ; 177
	i32 229, ; 178
	i32 354, ; 179
	i32 181, ; 180
	i32 32, ; 181
	i32 174, ; 182
	i32 188, ; 183
	i32 400, ; 184
	i32 122, ; 185
	i32 72, ; 186
	i32 62, ; 187
	i32 224, ; 188
	i32 161, ; 189
	i32 113, ; 190
	i32 175, ; 191
	i32 88, ; 192
	i32 186, ; 193
	i32 353, ; 194
	i32 105, ; 195
	i32 18, ; 196
	i32 146, ; 197
	i32 118, ; 198
	i32 58, ; 199
	i32 259, ; 200
	i32 17, ; 201
	i32 208, ; 202
	i32 52, ; 203
	i32 205, ; 204
	i32 92, ; 205
	i32 228, ; 206
	i32 350, ; 207
	i32 55, ; 208
	i32 129, ; 209
	i32 194, ; 210
	i32 152, ; 211
	i32 41, ; 212
	i32 92, ; 213
	i32 369, ; 214
	i32 303, ; 215
	i32 410, ; 216
	i32 50, ; 217
	i32 320, ; 218
	i32 374, ; 219
	i32 162, ; 220
	i32 432, ; 221
	i32 13, ; 222
	i32 277, ; 223
	i32 241, ; 224
	i32 298, ; 225
	i32 36, ; 226
	i32 67, ; 227
	i32 109, ; 228
	i32 414, ; 229
	i32 384, ; 230
	i32 207, ; 231
	i32 356, ; 232
	i32 242, ; 233
	i32 380, ; 234
	i32 99, ; 235
	i32 99, ; 236
	i32 11, ; 237
	i32 11, ; 238
	i32 284, ; 239
	i32 25, ; 240
	i32 128, ; 241
	i32 76, ; 242
	i32 276, ; 243
	i32 206, ; 244
	i32 109, ; 245
	i32 355, ; 246
	i32 195, ; 247
	i32 302, ; 248
	i32 300, ; 249
	i32 106, ; 250
	i32 407, ; 251
	i32 403, ; 252
	i32 2, ; 253
	i32 26, ; 254
	i32 255, ; 255
	i32 157, ; 256
	i32 346, ; 257
	i32 236, ; 258
	i32 212, ; 259
	i32 21, ; 260
	i32 349, ; 261
	i32 49, ; 262
	i32 43, ; 263
	i32 126, ; 264
	i32 245, ; 265
	i32 59, ; 266
	i32 409, ; 267
	i32 119, ; 268
	i32 215, ; 269
	i32 428, ; 270
	i32 305, ; 271
	i32 268, ; 272
	i32 254, ; 273
	i32 3, ; 274
	i32 421, ; 275
	i32 274, ; 276
	i32 427, ; 277
	i32 294, ; 278
	i32 38, ; 279
	i32 124, ; 280
	i32 433, ; 281
	i32 343, ; 282
	i32 294, ; 283
	i32 343, ; 284
	i32 137, ; 285
	i32 149, ; 286
	i32 85, ; 287
	i32 90, ; 288
	i32 423, ; 289
	i32 278, ; 290
	i32 194, ; 291
	i32 434, ; 292
	i32 275, ; 293
	i32 420, ; 294
	i32 210, ; 295
	i32 331, ; 296
	i32 250, ; 297
	i32 261, ; 298
	i32 306, ; 299
	i32 184, ; 300
	i32 311, ; 301
	i32 276, ; 302
	i32 133, ; 303
	i32 371, ; 304
	i32 380, ; 305
	i32 96, ; 306
	i32 430, ; 307
	i32 3, ; 308
	i32 339, ; 309
	i32 402, ; 310
	i32 193, ; 311
	i32 105, ; 312
	i32 342, ; 313
	i32 33, ; 314
	i32 394, ; 315
	i32 154, ; 316
	i32 158, ; 317
	i32 155, ; 318
	i32 82, ; 319
	i32 232, ; 320
	i32 270, ; 321
	i32 204, ; 322
	i32 143, ; 323
	i32 87, ; 324
	i32 19, ; 325
	i32 271, ; 326
	i32 51, ; 327
	i32 377, ; 328
	i32 222, ; 329
	i32 240, ; 330
	i32 346, ; 331
	i32 61, ; 332
	i32 203, ; 333
	i32 54, ; 334
	i32 4, ; 335
	i32 97, ; 336
	i32 239, ; 337
	i32 376, ; 338
	i32 17, ; 339
	i32 155, ; 340
	i32 84, ; 341
	i32 415, ; 342
	i32 29, ; 343
	i32 359, ; 344
	i32 45, ; 345
	i32 370, ; 346
	i32 64, ; 347
	i32 411, ; 348
	i32 368, ; 349
	i32 66, ; 350
	i32 337, ; 351
	i32 172, ; 352
	i32 279, ; 353
	i32 1, ; 354
	i32 314, ; 355
	i32 47, ; 356
	i32 24, ; 357
	i32 247, ; 358
	i32 370, ; 359
	i32 385, ; 360
	i32 207, ; 361
	i32 165, ; 362
	i32 108, ; 363
	i32 429, ; 364
	i32 221, ; 365
	i32 12, ; 366
	i32 273, ; 367
	i32 63, ; 368
	i32 27, ; 369
	i32 23, ; 370
	i32 93, ; 371
	i32 168, ; 372
	i32 12, ; 373
	i32 318, ; 374
	i32 427, ; 375
	i32 381, ; 376
	i32 191, ; 377
	i32 29, ; 378
	i32 103, ; 379
	i32 235, ; 380
	i32 14, ; 381
	i32 126, ; 382
	i32 256, ; 383
	i32 288, ; 384
	i32 375, ; 385
	i32 91, ; 386
	i32 277, ; 387
	i32 214, ; 388
	i32 234, ; 389
	i32 9, ; 390
	i32 360, ; 391
	i32 86, ; 392
	i32 398, ; 393
	i32 406, ; 394
	i32 385, ; 395
	i32 267, ; 396
	i32 300, ; 397
	i32 395, ; 398
	i32 341, ; 399
	i32 71, ; 400
	i32 168, ; 401
	i32 1, ; 402
	i32 287, ; 403
	i32 5, ; 404
	i32 341, ; 405
	i32 44, ; 406
	i32 27, ; 407
	i32 357, ; 408
	i32 411, ; 409
	i32 361, ; 410
	i32 315, ; 411
	i32 382, ; 412
	i32 158, ; 413
	i32 290, ; 414
	i32 112, ; 415
	i32 355, ; 416
	i32 351, ; 417
	i32 121, ; 418
	i32 424, ; 419
	i32 305, ; 420
	i32 246, ; 421
	i32 357, ; 422
	i32 159, ; 423
	i32 131, ; 424
	i32 310, ; 425
	i32 57, ; 426
	i32 408, ; 427
	i32 138, ; 428
	i32 83, ; 429
	i32 30, ; 430
	i32 257, ; 431
	i32 424, ; 432
	i32 10, ; 433
	i32 217, ; 434
	i32 307, ; 435
	i32 171, ; 436
	i32 366, ; 437
	i32 254, ; 438
	i32 366, ; 439
	i32 150, ; 440
	i32 94, ; 441
	i32 412, ; 442
	i32 267, ; 443
	i32 60, ; 444
	i32 189, ; 445
	i32 220, ; 446
	i32 365, ; 447
	i32 157, ; 448
	i32 211, ; 449
	i32 326, ; 450
	i32 183, ; 451
	i32 64, ; 452
	i32 88, ; 453
	i32 79, ; 454
	i32 47, ; 455
	i32 187, ; 456
	i32 143, ; 457
	i32 323, ; 458
	i32 214, ; 459
	i32 373, ; 460
	i32 316, ; 461
	i32 261, ; 462
	i32 74, ; 463
	i32 91, ; 464
	i32 313, ; 465
	i32 135, ; 466
	i32 90, ; 467
	i32 299, ; 468
	i32 319, ; 469
	i32 379, ; 470
	i32 258, ; 471
	i32 176, ; 472
	i32 394, ; 473
	i32 223, ; 474
	i32 372, ; 475
	i32 321, ; 476
	i32 112, ; 477
	i32 42, ; 478
	i32 159, ; 479
	i32 4, ; 480
	i32 103, ; 481
	i32 70, ; 482
	i32 60, ; 483
	i32 39, ; 484
	i32 401, ; 485
	i32 208, ; 486
	i32 248, ; 487
	i32 153, ; 488
	i32 56, ; 489
	i32 34, ; 490
	i32 406, ; 491
	i32 182, ; 492
	i32 189, ; 493
	i32 245, ; 494
	i32 21, ; 495
	i32 163, ; 496
	i32 216, ; 497
	i32 311, ; 498
	i32 175, ; 499
	i32 201, ; 500
	i32 332, ; 501
	i32 200, ; 502
	i32 369, ; 503
	i32 309, ; 504
	i32 376, ; 505
	i32 304, ; 506
	i32 140, ; 507
	i32 335, ; 508
	i32 184, ; 509
	i32 89, ; 510
	i32 147, ; 511
	i32 260, ; 512
	i32 227, ; 513
	i32 162, ; 514
	i32 419, ; 515
	i32 289, ; 516
	i32 199, ; 517
	i32 195, ; 518
	i32 6, ; 519
	i32 169, ; 520
	i32 31, ; 521
	i32 389, ; 522
	i32 383, ; 523
	i32 107, ; 524
	i32 270, ; 525
	i32 231, ; 526
	i32 333, ; 527
	i32 304, ; 528
	i32 181, ; 529
	i32 243, ; 530
	i32 297, ; 531
	i32 397, ; 532
	i32 167, ; 533
	i32 368, ; 534
	i32 271, ; 535
	i32 140, ; 536
	i32 329, ; 537
	i32 59, ; 538
	i32 144, ; 539
	i32 391, ; 540
	i32 426, ; 541
	i32 364, ; 542
	i32 81, ; 543
	i32 401, ; 544
	i32 233, ; 545
	i32 74, ; 546
	i32 130, ; 547
	i32 25, ; 548
	i32 7, ; 549
	i32 93, ; 550
	i32 402, ; 551
	i32 301, ; 552
	i32 137, ; 553
	i32 237, ; 554
	i32 113, ; 555
	i32 9, ; 556
	i32 231, ; 557
	i32 104, ; 558
	i32 367, ; 559
	i32 19, ; 560
	i32 269, ; 561
	i32 283, ; 562
	i32 198, ; 563
	i32 434, ; 564
	i32 432, ; 565
	i32 263, ; 566
	i32 33, ; 567
	i32 251, ; 568
	i32 46, ; 569
	i32 416, ; 570
	i32 381, ; 571
	i32 334, ; 572
	i32 30, ; 573
	i32 252, ; 574
	i32 57, ; 575
	i32 134, ; 576
	i32 114, ; 577
	i32 192, ; 578
	i32 306, ; 579
	i32 420, ; 580
	i32 347, ; 581
	i32 317, ; 582
	i32 55, ; 583
	i32 185, ; 584
	i32 6, ; 585
	i32 211, ; 586
	i32 77, ; 587
	i32 396, ; 588
	i32 230, ; 589
	i32 262, ; 590
	i32 378, ; 591
	i32 367, ; 592
	i32 0, ; 593
	i32 111, ; 594
	i32 430, ; 595
	i32 226, ; 596
	i32 266, ; 597
	i32 383, ; 598
	i32 234, ; 599
	i32 102, ; 600
	i32 321, ; 601
	i32 335, ; 602
	i32 362, ; 603
	i32 170, ; 604
	i32 115, ; 605
	i32 329, ; 606
	i32 301, ; 607
	i32 256, ; 608
	i32 76, ; 609
	i32 312, ; 610
	i32 85, ; 611
	i32 314, ; 612
	i32 349, ; 613
	i32 249, ; 614
	i32 222, ; 615
	i32 350, ; 616
	i32 333, ; 617
	i32 291, ; 618
	i32 160, ; 619
	i32 2, ; 620
	i32 262, ; 621
	i32 24, ; 622
	i32 242, ; 623
	i32 32, ; 624
	i32 215, ; 625
	i32 117, ; 626
	i32 37, ; 627
	i32 16, ; 628
	i32 328, ; 629
	i32 52, ; 630
	i32 331, ; 631
	i32 197, ; 632
	i32 315, ; 633
	i32 417, ; 634
	i32 20, ; 635
	i32 236, ; 636
	i32 123, ; 637
	i32 154, ; 638
	i32 269, ; 639
	i32 359, ; 640
	i32 404, ; 641
	i32 131, ; 642
	i32 323, ; 643
	i32 251, ; 644
	i32 148, ; 645
	i32 206, ; 646
	i32 238, ; 647
	i32 120, ; 648
	i32 28, ; 649
	i32 132, ; 650
	i32 100, ; 651
	i32 134, ; 652
	i32 289, ; 653
	i32 153, ; 654
	i32 97, ; 655
	i32 125, ; 656
	i32 388, ; 657
	i32 239, ; 658
	i32 69, ; 659
	i32 417, ; 660
	i32 217, ; 661
	i32 428, ; 662
	i32 409, ; 663
	i32 72, ; 664
	i32 344, ; 665
	i32 274, ; 666
	i32 292, ; 667
	i32 325, ; 668
	i32 136, ; 669
	i32 124, ; 670
	i32 71, ; 671
	i32 378, ; 672
	i32 111, ; 673
	i32 425, ; 674
	i32 284, ; 675
	i32 209, ; 676
	i32 179, ; 677
	i32 152, ; 678
	i32 336, ; 679
	i32 352, ; 680
	i32 431, ; 681
	i32 374, ; 682
	i32 312, ; 683
	i32 405, ; 684
	i32 390, ; 685
	i32 118, ; 686
	i32 210, ; 687
	i32 260, ; 688
	i32 173, ; 689
	i32 353, ; 690
	i32 320, ; 691
	i32 127, ; 692
	i32 133, ; 693
	i32 180, ; 694
	i32 77, ; 695
	i32 46, ; 696
	i32 263, ; 697
	i32 73, ; 698
	i32 422, ; 699
	i32 426, ; 700
	i32 63, ; 701
	i32 395, ; 702
	i32 98, ; 703
	i32 84, ; 704
	i32 387, ; 705
	i32 337, ; 706
	i32 43, ; 707
	i32 61, ; 708
	i32 290, ; 709
	i32 425, ; 710
	i32 178, ; 711
	i32 37, ; 712
	i32 361, ; 713
	i32 431, ; 714
	i32 40, ; 715
	i32 253, ; 716
	i32 318, ; 717
	i32 160, ; 718
	i32 224, ; 719
	i32 98, ; 720
	i32 225, ; 721
	i32 258, ; 722
	i32 180, ; 723
	i32 202, ; 724
	i32 228, ; 725
	i32 203, ; 726
	i32 135, ; 727
	i32 20, ; 728
	i32 65, ; 729
	i32 324, ; 730
	i32 125, ; 731
	i32 75, ; 732
	i32 416, ; 733
	i32 282, ; 734
	i32 164, ; 735
	i32 156, ; 736
	i32 324, ; 737
	i32 398, ; 738
	i32 5, ; 739
	i32 332, ; 740
	i32 389, ; 741
	i32 49, ; 742
	i32 296, ; 743
	i32 325, ; 744
	i32 144, ; 745
	i32 139, ; 746
	i32 100, ; 747
	i32 418, ; 748
	i32 186, ; 749
	i32 123, ; 750
	i32 120, ; 751
	i32 413, ; 752
	i32 142, ; 753
	i32 39, ; 754
	i32 68, ; 755
	i32 41, ; 756
	i32 364, ; 757
	i32 413, ; 758
	i32 202, ; 759
	i32 164, ; 760
	i32 219, ; 761
	i32 229, ; 762
	i32 73, ; 763
	i32 375, ; 764
	i32 338, ; 765
	i32 165, ; 766
	i32 182, ; 767
	i32 127, ; 768
	i32 268, ; 769
	i32 317, ; 770
	i32 68, ; 771
	i32 169, ; 772
	i32 382, ; 773
	i32 221, ; 774
	i32 192, ; 775
	i32 386, ; 776
	i32 213, ; 777
	i32 281, ; 778
	i32 255, ; 779
	i32 225, ; 780
	i32 191, ; 781
	i32 288, ; 782
	i32 151, ; 783
	i32 45, ; 784
	i32 108, ; 785
	i32 48, ; 786
	i32 96, ; 787
	i32 31, ; 788
	i32 193, ; 789
	i32 23, ; 790
	i32 393, ; 791
	i32 166, ; 792
	i32 22, ; 793
	i32 196, ; 794
	i32 138, ; 795
	i32 78, ; 796
	i32 345, ; 797
	i32 54, ; 798
	i32 281, ; 799
	i32 286, ; 800
	i32 10, ; 801
	i32 388, ; 802
	i32 244, ; 803
	i32 285, ; 804
	i32 272, ; 805
	i32 16, ; 806
	i32 352, ; 807
	i32 139, ; 808
	i32 403, ; 809
	i32 422, ; 810
	i32 13, ; 811
	i32 15, ; 812
	i32 122, ; 813
	i32 87, ; 814
	i32 149, ; 815
	i32 22, ; 816
	i32 34, ; 817
	i32 79, ; 818
	i32 330, ; 819
	i32 392, ; 820
	i32 310, ; 821
	i32 345, ; 822
	i32 147, ; 823
	i32 414, ; 824
	i32 80, ; 825
	i32 328, ; 826
	i32 173, ; 827
	i32 233, ; 828
	i32 237, ; 829
	i32 340, ; 830
	i32 42, ; 831
	i32 26, ; 832
	i32 351, ; 833
	i32 283, ; 834
	i32 280, ; 835
	i32 107, ; 836
	i32 220, ; 837
	i32 110, ; 838
	i32 212, ; 839
	i32 372, ; 840
	i32 200, ; 841
	i32 7, ; 842
	i32 354, ; 843
	i32 201, ; 844
	i32 397, ; 845
	i32 363, ; 846
	i32 313, ; 847
	i32 377, ; 848
	i32 44, ; 849
	i32 358, ; 850
	i32 161, ; 851
	i32 148, ; 852
	i32 339, ; 853
	i32 249, ; 854
	i32 285, ; 855
	i32 423, ; 856
	i32 38, ; 857
	i32 15, ; 858
	i32 429, ; 859
	i32 174, ; 860
	i32 146, ; 861
	i32 235, ; 862
	i32 8, ; 863
	i32 266, ; 864
	i32 287, ; 865
	i32 130, ; 866
	i32 334, ; 867
	i32 303, ; 868
	i32 94 ; 869
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
