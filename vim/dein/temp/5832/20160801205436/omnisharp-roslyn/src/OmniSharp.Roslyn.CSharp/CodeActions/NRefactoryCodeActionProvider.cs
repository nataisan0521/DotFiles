#if DNX451
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Composition;
using System.Linq;
using System.Reflection;
using ICSharpCode.NRefactory6.CSharp.Refactoring;
using Microsoft.CodeAnalysis.CodeFixes;
using OmniSharp.Services;

namespace OmniSharp.Roslyn.CSharp.Services.CodeActions
{
    [Export(typeof(ICodeActionProvider))]
    public class NRefactoryCodeActionProvider : AbstractCodeActionProvider
    {
        [ImportingConstructor]
        public NRefactoryCodeActionProvider() : base(typeof(UseVarKeywordAction).Assembly)
        {
        }

        public override IEnumerable<CodeFixProvider> CodeFixes => Enumerable.Empty<CodeFixProvider>();

        public override string ProviderName => "NRefactory";
    }
}
#endif
