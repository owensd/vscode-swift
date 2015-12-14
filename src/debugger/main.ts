/*---------------------------------------------------------
 * Copyright (C) David Owens II. All rights reserved.
 *--------------------------------------------------------*/
import { DebugSession, InitializedEvent, TerminatedEvent, StoppedEvent, OutputEvent, Thread, StackFrame, Scope, Source } from './common/debugSession';

require("console-stamp")(console);

class SwiftDebugSession extends DebugSession {

	public constructor(debuggerLinesStartAt1: boolean, isServer: boolean = false) {
		super(debuggerLinesStartAt1, isServer);
	}

	protected initializeRequest(response: DebugProtocol.InitializeResponse, args: DebugProtocol.InitializeRequestArguments): void {
		console.log("InitializeRequest");
		this.sendResponse(response);
		console.log("InitializeResponse")
		this.sendEvent(new InitializedEvent());
		console.log("InitializeEvent");
	}

	protected launchRequest(response: DebugProtocol.LaunchResponse, args: LaunchRequestArguments): void {
		console.error('Not yet implemented: launchRequest');
		this.sendErrorResponse(response, 2000, "Launch is not yet supported");
	}

	protected disconnectRequest(response: DebugProtocol.DisconnectResponse, args: DebugProtocol.DisconnectArguments): void {
		console.error('Not yet implemented: disconnectRequest');
		this.sendErrorResponse(response, 2000, "Disconnect is not yet supported");
	}
	
	protected setExceptionBreakPointsRequest(response: DebugProtocol.SetExceptionBreakpointsResponse, args: DebugProtocol.SetExceptionBreakpointsArguments): void {
		console.error('Not yet implemented: setExceptionBreakPointRequest');
		this.sendErrorResponse(response, 2000, "Set exception break point is not yet supported");
	}

	protected setBreakPointsRequest(response: DebugProtocol.SetBreakpointsResponse, args: DebugProtocol.SetBreakpointsArguments): void {
		console.error('Not yet implemented: setBreakPointRequest');
		this.sendErrorResponse(response, 2000, "Set break point is not yet supported");
	}

	protected threadsRequest(response: DebugProtocol.ThreadsResponse): void {
		console.error('Not yet implemented: threadRequest');
		this.sendErrorResponse(response, 2000, "Threads is not yet supported");
	}

	protected stackTraceRequest(response: DebugProtocol.StackTraceResponse, args: DebugProtocol.StackTraceArguments): void {
		console.error('Not yet implemented: stackTraceRequest');
		this.sendErrorResponse(response, 2000, "Stack Trace is not yet supported");
	}

	protected scopesRequest(response: DebugProtocol.ScopesResponse, args: DebugProtocol.ScopesArguments): void {
		console.error('Not yet implemented: scopesRequest');
		this.sendErrorResponse(response, 2000, "Scopes is not yet supported");
	}

	protected variablesRequest(response: DebugProtocol.VariablesResponse, args: DebugProtocol.VariablesArguments): void {
		console.error('Not yet implemented: variablesRequest');
		this.sendErrorResponse(response, 2000, "Variables is not yet supported");
	}

	protected continueRequest(response: DebugProtocol.ContinueResponse): void {
		console.error('Not yet implemented: continueRequest');
		this.sendErrorResponse(response, 2000, "Continue is not yet supported");
	}

	protected nextRequest(response: DebugProtocol.NextResponse): void {
		console.error('Not yet implemented: nextRequest');
		this.sendErrorResponse(response, 2000, "Next is not yet supported");
	}

	protected stepInRequest(response: DebugProtocol.StepInResponse): void {
		console.error('Not yet implemented: stepInRequest');
		this.sendErrorResponse(response, 2000, "Step In is not yet supported");
	}

	protected stepOutRequest(response: DebugProtocol.StepOutResponse): void {
		console.error('Not yet implemented: stepOutRequest');
		this.sendErrorResponse(response, 2000, "Step out is not yet supported");
	}

	protected pauseRequest(response: DebugProtocol.PauseResponse): void {
		console.error('Not yet implemented: pauseRequest');
		this.sendErrorResponse(response, 2000, "Pause is not yet supported");
	}

	protected evaluateRequest(response: DebugProtocol.EvaluateResponse, args: DebugProtocol.EvaluateArguments): void {
		console.error('Not yet implemented: evaluateRequest');
		this.sendErrorResponse(response, 2000, "Evaluate is not yet supported");
	}
}

DebugSession.run(SwiftDebugSession);