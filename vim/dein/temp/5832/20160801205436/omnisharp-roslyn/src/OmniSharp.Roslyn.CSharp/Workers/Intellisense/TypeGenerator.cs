//
// TypeGenerator.cs
//
// Author:
//       Mike Krüger <mkrueger@xamarin.com>
//
// Copyright (c) 2015 Xamarin Inc. (http://xamarin.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Reflection;
using System.Runtime.ExceptionServices;
using System.Threading;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CodeGeneration;
using Microsoft.CodeAnalysis.LanguageServices;
using Microsoft.CodeAnalysis.Shared.Utilities;
using Roslyn.Utilities;

namespace OmniSharp.Intellisense
{
    class TypeGenerator
    {
        readonly static Type typeInfo;

        object instance;

        readonly static MethodInfo createArrayTypeSymbolMethod;
        readonly static MethodInfo createPointerTypeSymbolMethod;
        readonly static MethodInfo constructMethod;

        internal object Instance
        {
            get
            {
                return instance;
            }
        }

        static TypeGenerator()
        {
            typeInfo = Type.GetType("Microsoft.CodeAnalysis.CodeGeneration.TypeGenerator" + ReflectionNamespaces.WorkspacesAsmName, true);

            createArrayTypeSymbolMethod = typeInfo.GetMethod("CreateArrayTypeSymbol");
            createPointerTypeSymbolMethod = typeInfo.GetMethod("CreatePointerTypeSymbol");
            constructMethod = typeInfo.GetMethod("Construct");
        }

        public TypeGenerator()
        {
            instance = Activator.CreateInstance(typeInfo);
        }

        public ITypeSymbol CreateArrayTypeSymbol(ITypeSymbol elementType, int rank)
        {
            try
            {
                return (ITypeSymbol)createArrayTypeSymbolMethod.Invoke(instance, new object[] { elementType, rank });
            }
            catch (TargetInvocationException ex)
            {
                ExceptionDispatchInfo.Capture(ex.InnerException).Throw();
                return null;
            }
        }

        public ITypeSymbol CreatePointerTypeSymbol(ITypeSymbol pointedAtType)
        {
            try
            {
                return (ITypeSymbol)createPointerTypeSymbolMethod.Invoke(instance, new object[] { pointedAtType });
            }
            catch (TargetInvocationException ex)
            {
                ExceptionDispatchInfo.Capture(ex.InnerException).Throw();
                return null;
            }
        }

        public ITypeSymbol Construct(INamedTypeSymbol namedType, ITypeSymbol[] typeArguments)
        {
            try
            {
                return (ITypeSymbol)constructMethod.Invoke(instance, new object[] { namedType, typeArguments });
            }
            catch (TargetInvocationException ex)
            {
                ExceptionDispatchInfo.Capture(ex.InnerException).Throw();
                return null;
            }
        }
    }

}
